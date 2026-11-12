# Testes de contrato em processos isolados; backend simulado, sem Docker ou modelo.
$ErrorActionPreference = 'Stop'
$engine = Join-Path $PSHOME 'powershell.exe'
if (-not (Test-Path -LiteralPath $engine)) { $engine = Join-Path $PSHOME 'pwsh.exe' }
$helper = Join-Path (Split-Path -Parent $PSScriptRoot) 'scripts\transcribe.ps1'
$temporary = Join-Path ([System.IO.Path]::GetTempPath()) ('whisper-agent-' + [guid]::NewGuid().ToString('N'))
$originalEnv = $env:WHISPER_BOX_ROOT
$originalScenario = $env:WHISPER_AGENT_TEST_CASE
$count = 0
New-Item -ItemType Directory -Path $temporary | Out-Null
$fixture = Join-Path $temporary 'recording.wav'
[System.IO.File]::WriteAllBytes($fixture, [byte[]]@(0, 1, 2))
$fakeBackend = @'
$ErrorActionPreference = 'Stop'
$command = $args[0]
$case = $env:WHISPER_AGENT_TEST_CASE
$history = Join-Path $PSScriptRoot 'calls.txt'
Add-Content -LiteralPath $history -Value $command
$calls = @(Get-Content -LiteralPath $history)
switch ($command) {
    'start' {
        if ($case -eq 'start-failed') { '{"error":{"code":"docker_error","message":"not ready"}}'; exit 1 }
        '{"status":"ready"}'; exit 0
    }
    'submit' { '{"job_id":"test-job","status":"queued"}'; exit 0 }
    'wait' {
        if ($case -eq 'failure') { '{"job_id":"test-job","status":"failed","error":{"code":"invalid_media"}}'; exit 1 }
        if ($case -eq 'unknown') { '{"error":{"code":"job_not_found"}}'; exit 3 }
        if ($case -eq 'timeout') { Start-Sleep -Seconds 1; '{"job_id":"test-job","status":"running","timed_out":true}'; exit 2 }
        if ($case -eq 'loop' -and @($calls | Where-Object { $_ -eq 'wait' }).Count -lt 3) {
            '{"job_id":"test-job","status":"running","timed_out":true}'; exit 2
        }
        '{"job_id":"test-job","status":"succeeded"}'; exit 0
    }
    'result' {
        if ($case -eq 'pending-result' -and @($calls | Where-Object { $_ -eq 'result' }).Count -eq 1) {
            '{"job_id":"test-job","status":"running"}'; exit 4
        }
        $files = @{}
        foreach ($key in @('text', 'srt', 'segments', 'metadata')) {
            $files[$key] = Join-Path $PSScriptRoot ($key + '.fixture')
            if ($case -ne 'missing-file') { Set-Content -LiteralPath $files[$key] -Value 'fixture' }
        }
        @{job_id='test-job'; status='succeeded'; files=$files} | ConvertTo-Json -Compress
        exit 0
    }
}
exit 1
'@
[System.IO.File]::WriteAllText((Join-Path $temporary 'whisper-box.ps1'), $fakeBackend)

function Run-Case([string] $case, [int] $expected, [string[]] $options) {
    $env:WHISPER_AGENT_TEST_CASE = $case
    $env:WHISPER_BOX_ROOT = $temporary
    $history = Join-Path $temporary 'calls.txt'
    if (Test-Path -LiteralPath $history) { Clear-Content -LiteralPath $history }
    Get-ChildItem -LiteralPath $temporary -Filter '*.fixture' | Remove-Item
    $lines = @(& $engine -NoProfile -ExecutionPolicy Bypass -File $helper @options)
    if ($LASTEXITCODE -ne $expected) { throw ('Codigo incorreto no caso ' + $case + ': ' + $LASTEXITCODE) }
    if ($lines.Count -ne 1) { throw ('stdout incorreto: ' + $case) }
    $body = $lines[0] | ConvertFrom-Json
    $script:count++
    return @{ body = $body; calls = @(if (Test-Path -LiteralPath $history) { Get-Content -LiteralPath $history }) }
}

try {
    $success = Run-Case 'loop' 0 @('-InputPath', $fixture)
    if (($success.calls -join ',') -ne 'start,submit,wait,wait,wait,result') { throw 'A espera deve ocorrer sem repetir submit.' }
    if ($success.body.status -ne 'succeeded') { throw 'Sucesso nao confirmado.' }
    $resume = Run-Case 'resume' 0 @('-JobId', 'test-job')
    if (($resume.calls -join ',') -ne 'start,wait,result') { throw 'Retomada nao deve submeter novamente.' }
    $timed = Run-Case 'timeout' 2 @('-JobId', 'test-job', '-TimeoutSeconds', '1')
    if ($timed.body.job_id -ne 'test-job' -or -not $timed.body.wait_budget_exhausted) { throw 'Timeout deve preservar identificador.' }
    $failure = Run-Case 'failure' 1 @('-InputPath', $fixture)
    if (($failure.calls -join ',') -ne 'start,submit,wait') { throw 'Falha nao deve ressubmeter ou consultar resultado.' }
    $startFailed = Run-Case 'start-failed' 1 @('-InputPath', $fixture)
    if (($startFailed.calls -join ',') -ne 'start') { throw 'Start falho deve encerrar o fluxo.' }
    $pending = Run-Case 'pending-result' 0 @('-JobId', 'test-job')
    if (($pending.calls -join ',') -ne 'start,wait,result,wait,result') { throw 'Resultado pendente nao deve ser anunciado.' }
    Run-Case 'missing-file' 1 @('-JobId', 'test-job') | Out-Null
    Run-Case 'unknown' 3 @('-JobId', 'missing') | Out-Null
    $missing = Run-Case 'missing-input' 3 @('-InputPath', (Join-Path $temporary 'missing.wav'))
    if ($missing.calls.Count -ne 0) { throw 'Entrada ausente nao deve iniciar worker.' }
    Run-Case 'missing-project' 1 @('-JobId', 'test-job', '-ProjectRoot', (Join-Path $temporary 'missing-project')) | Out-Null
    Write-Output ('Aprovados: ' + $count + ' casos de contrato do agente Whisper.')
} finally {
    $env:WHISPER_BOX_ROOT = $originalEnv
    $env:WHISPER_AGENT_TEST_CASE = $originalScenario
    $resolvedTemporary = [System.IO.Path]::GetFullPath($temporary)
    $tempRoot = [System.IO.Path]::GetFullPath([System.IO.Path]::GetTempPath()).TrimEnd('\') + '\'
    if (-not $resolvedTemporary.StartsWith($tempRoot, [StringComparison]::OrdinalIgnoreCase)) { throw 'Diretorio de teste fora da pasta temporaria.' }
    Remove-Item -LiteralPath $resolvedTemporary -Recurse -Force
}
