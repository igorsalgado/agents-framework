[CmdletBinding(DefaultParameterSetName = 'Input')]
param(
    [Parameter(Mandatory = $true, ParameterSetName = 'Input')]
    [string] $InputPath,
    [Parameter(Mandatory = $true, ParameterSetName = 'Resume')]
    [string] $JobId,
    [Parameter(ParameterSetName = 'Input')]
    [ValidateSet('pt', 'en', 'es', 'auto')]
    [string] $Language = 'pt',
    [string] $ProjectRoot,
    [ValidateRange(1, 86400)]
    [int] $TimeoutSeconds = 7200
)

$ErrorActionPreference = 'Stop'
$previousEncoding = [Console]::OutputEncoding
[Console]::OutputEncoding = New-Object System.Text.UTF8Encoding($false)
$engine = Join-Path $PSHOME 'powershell.exe'
if (-not (Test-Path -LiteralPath $engine)) { $engine = Join-Path $PSHOME 'pwsh.exe' }
$knownJob = $JobId
$runner = $null

function Complete-Whisper($body, [int] $code) {
    $body | ConvertTo-Json -Depth 12 -Compress
    exit $code
}

function Invoke-Box([string[]] $arguments) {
    $lines = @(& $engine -NoProfile -ExecutionPolicy Bypass -File $runner @arguments)
    $code = $LASTEXITCODE
    if ($lines.Count -ne 1) { throw 'O projeto deve retornar uma linha JSON em stdout.' }
    $body = $lines[0] | ConvertFrom-Json
    return @{ body = $body; code = $code }
}

try {
    if (-not $ProjectRoot) { $ProjectRoot = $env:WHISPER_BOX_ROOT }
    if (-not $ProjectRoot) { $ProjectRoot = Join-Path $env:USERPROFILE 'Desktop\Dev\whisper-box' }
    $runner = Join-Path $ProjectRoot 'whisper-box.ps1'
    if (-not (Test-Path -LiteralPath $runner -PathType Leaf)) {
        Complete-Whisper @{ error = @{ code = 'project_not_found'; message = 'Configure WHISPER_BOX_ROOT ou -ProjectRoot com o projeto Whisper Box preparado.' } } 1
    }
    if ($PSCmdlet.ParameterSetName -eq 'Input' -and -not (Test-Path -LiteralPath $InputPath -PathType Leaf)) {
        Complete-Whisper @{ error = @{ code = 'input_not_found'; message = 'Informe uma gravacao finalizada existente.' } } 3
    }
    $started = Invoke-Box @('start')
    if ($started.code -ne 0) { Complete-Whisper $started.body $started.code }
    if ($PSCmdlet.ParameterSetName -eq 'Input') {
        $absoluteInput = (Resolve-Path -LiteralPath $InputPath).Path
        $submitted = Invoke-Box @('submit', '--input', $absoluteInput, '--language', $Language)
        if ($submitted.code -ne 0) { Complete-Whisper $submitted.body $submitted.code }
        $knownJob = $submitted.body.job_id
    }
    if (-not $knownJob) { throw 'O projeto nao devolveu um job_id.' }
    [Console]::Error.WriteLine((@{ event = 'whisper_waiting'; job_id = $knownJob } | ConvertTo-Json -Compress))
    $deadline = [DateTime]::UtcNow.AddSeconds($TimeoutSeconds)
    while ($true) {
        $remaining = [int][Math]::Ceiling(($deadline - [DateTime]::UtcNow).TotalSeconds)
        if ($remaining -le 0) {
            Complete-Whisper @{ job_id = $knownJob; status = $observed.body.status; timed_out = $true; wait_budget_exhausted = $true } 2
        }
        $window = [Math]::Min(30, $remaining)
        $observed = Invoke-Box @('wait', '--job', $knownJob, '--timeout', [string]$window)
        if ($observed.code -eq 2) { continue }
        if ($observed.code -ne 0) { Complete-Whisper $observed.body $observed.code }
        $result = Invoke-Box @('result', '--job', $knownJob)
        if ($result.code -eq 4) { continue }
        if ($result.code -ne 0) { Complete-Whisper $result.body $result.code }
        if ($result.body.status -ne 'succeeded') { throw 'Estado final inesperado.' }
        foreach ($key in @('text', 'srt', 'segments', 'metadata')) {
            if (-not $result.body.files.$key -or -not (Test-Path -LiteralPath $result.body.files.$key -PathType Leaf)) {
                throw 'Artefatos finais ausentes ou inacessiveis.'
            }
        }
        Complete-Whisper $result.body 0
    }
} catch {
    Complete-Whisper @{ job_id = $knownJob; error = @{ code = 'agent_operation_failed'; message = $_.Exception.Message } } 1
} finally {
    [Console]::OutputEncoding = $previousEncoding
}
