# Tools: Whisper

## Projeto de transcrição

- Projeto: **Whisper Box**, separado do framework.
- Repositório privado: https://r.jina.ai/https://github.com/igorsalgado/whisper-box
- Contrato executável: `whisper-box.ps1`, na raiz desse projeto.
- Documentação de referência: `README.md`, `AGENTS.md` e `docs/VALIDACAO.md` do Whisper Box.
- Pré-requisitos: PowerShell 5.1+, Docker Desktop com engine Linux e modelo previamente preparado.

## Localização

O comando do agente resolve o projeto nesta ordem:

1. Parâmetro `-ProjectRoot` fornecido pelo chamador.
2. Variável de ambiente `WHISPER_BOX_ROOT`.
3. `%USERPROFILE%\Desktop\Dev\whisper-box`.

Isso atende diferentes usuários e às branches `master` e `main-work`, sem fixar o nome do perfil Windows.

## Comando do agente

Na raiz do framework:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\whisper\scripts\transcribe.ps1 -InputPath "C:\Reunioes\gravacao.mp4"
```

O agente executa esse comando. O usuário apenas solicita: **“Whisper, transcreva esta gravação e me entregue a saída.”**

- `-Language`: `pt` por padrão; também `en`, `es` e `auto`.
- `-JobId`: acompanha um trabalho existente; substitui `-InputPath`.
- `-TimeoutSeconds`: orçamento de espera, padrão de 7.200 s; a inferência pode continuar após esse prazo.
- `-ProjectRoot`: caminho alternativo do Whisper Box.

O comando encapsula `start → submit → wait → result`. `wait` é renovado internamente em janelas de até 30 s. stdout contém somente o JSON final; stderr contém diagnóstico e um evento com `job_id` para reconexão.

## Preparação inicial

Imagem e modelo precisam existir antes da primeira reunião. Quando o usuário solicitar a configuração inicial, execute `whisper-box.ps1 prepare` no projeto, com internet. Uma demanda normal de transcrição não dispara downloads automaticamente.

O runtime usa CPU, um trabalho por vez e rede desabilitada. O agente não altera limites, modelo ou Compose do projeto.

## Validação do agente

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\whisper\tests\test-transcribe.ps1
```

O teste usa um backend simulado em diretório temporário e cobre dez casos: espera renovada sem repetir submissão, retomada, orçamento esgotado, falha do trabalho, falha no start, resultado pendente, arquivo de saída ausente, trabalho inexistente, mídia ausente e projeto ausente. Não depende de Docker ou modelo para testar o contrato do helper.

Em 12/11/2026, o comando único também foi executado com o Whisper Box real: recuperou os quatro artefatos da gravação autorizada já transcrita e acompanhou uma nova mídia sintética, incluindo espera expirada e retomada do mesmo identificador. Nenhuma gravação ou saída real acompanha o framework.
