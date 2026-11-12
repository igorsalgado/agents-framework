---
name: whisper
description: Execute e acompanhe a transcrição local de gravações com Whisper Box. Use quando o usuário chamar o agente whisper, pedir transcrição de áudio/vídeo ou solicitar o resultado de um job existente.
---

# Whisper

Leia [agent.md](agent.md), [tools.md](tools.md) e [operation.md](skills/operation.md).

Receba o caminho da mídia ou o `job_id` já existente e execute [scripts/transcribe.ps1](scripts/transcribe.ps1). O próprio comando inicia o worker, submete quando necessário, aguarda em código e consulta o resultado. Acompanhe a sessão desse processo até terminar; não recrie o fluxo por reunião.

Leia [recovery.md](skills/recovery.md) quando houver prazo esgotado, desconexão ou falha; leia [results.md](skills/results.md) antes de devolver o resultado ao chamador. Preserve os arquivos da reunião no ambiente local.
