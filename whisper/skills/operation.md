# Skill: Operação da transcrição

## Quando usar

Ao receber “chame o Whisper”, uma gravação para transcrever ou um trabalho para acompanhar.

## Execução

O agente usa o helper do framework, a partir de qualquer diretório, com caminhos absolutos quando necessário:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "CAMINHO_DO_FRAMEWORK\whisper\scripts\transcribe.ps1" -InputPath "C:\Reunioes\gravacao.mp4"
```

Se o projeto estiver fora do local padrão, forneça `-ProjectRoot "D:\Projetos\whisper-box"` ou configure `WHISPER_BOX_ROOT` no ambiente do agente. Não altere as regras dos projetos da `main-work` para localizar o motor.

O helper verifica os parâmetros e executa a interface pública do Whisper Box. A gravação deve estar finalizada antes da submissão. Ele não muda o diretório de trabalho do agente chamador.

## Critérios operacionais

- Solicitar somente o caminho que estiver faltando; preservar idioma padrão quando o usuário não escolher outro.
- Executar o helper uma vez por solicitação. Se a ferramenta devolver um identificador de sessão, acompanhar essa mesma sessão.
- Deixar o loop de espera dentro do processo PowerShell. Consultas ocasionais da ferramenta à sessão podem ser necessárias; cada janela de espera não exige nova decisão do modelo.
- Após o término, devolver os caminhos; o projeto já valida a integridade dos artefatos.

## Anti-padrões

- Usar o script de uma reunião antiga como motor de transcrição.
- Copiar mídia ou resultados para dentro do framework.
- Trocar a implementação por APIs de áudio ou reescrever start/submit/wait em cada conversa.

## Referências

- `tools.md` deste agente para parâmetros e dependências.
- `README.md` e `AGENTS.md` do projeto Whisper Box instalado.
