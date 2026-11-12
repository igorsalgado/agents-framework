# Skill: Acompanhamento e recuperação

## Quando usar

Quando a espera atingir seu orçamento, a sessão do agente desconectar ou o sistema reportar falha.

## Acompanhar um trabalho existente

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\whisper\scripts\transcribe.ps1 -JobId "IDENTIFICADOR"
```

O helper inicia/verifica o worker e espera pelo mesmo identificador, sem nova submissão. Se houver `WHISPER_BOX_ROOT` ou `-ProjectRoot`, mantenha o mesmo projeto que recebeu a gravação.

## Decisões

- Código `2`: orçamento de espera esgotado. Entregar o identificador e informar que o processamento continua; acompanhar novamente com `-JobId` quando a tarefa exigir.
- Desconexão: recuperar o `job_id` do evento em stderr ou do retorno já recebido. Uma chamada interrompida após submissão pode continuar no worker.
- Identificador não disponível após desconexão: a mesma mídia e configuração podem ser submetidas novamente; a deduplicação pertence ao Whisper Box. Se já existe identificador, prefira retomá-lo.
- Código `1`: reportar a falha retornada. Não ressubmeter automaticamente nem trocar modelo/infraestrutura.
- Código `3`: corrigir o argumento ou localizar o trabalho. Caminho e identificador são alternativas, não parâmetros simultâneos.
- `model_not_ready`/falha no start: verificar a preparação explícita do projeto. Não baixar modelos durante a operação offline.

## Critérios de aceite

- Tempo de espera e tempo de transcrição são tratados separadamente.
- A retomada não cria outro trabalho quando o identificador já é conhecido.
- Nenhuma operação de recuperação remove a gravação original, resultados ou volumes.

## Referências

- `docs/VALIDACAO.md` do Whisper Box para as evidências de recuperação do worker.
