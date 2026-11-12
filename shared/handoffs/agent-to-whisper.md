# Handoff: agente chamador ↔ Whisper

## Entrada mínima

- Caminho absoluto de uma gravação finalizada ou identificador de um trabalho existente.
- Ambiente com acesso ao Docker e ao projeto Whisper Box preparado.
- Idioma ou caminho alternativo do projeto somente quando diferirem dos padrões.

Qualquer papel do framework pode acionar esse fluxo durante uma tarefa. A operação não exige story, ticket ou artefato de desenvolvimento adicional; as regras do projeto chamador continuam valendo para o trabalho que ele estava executando.

## Execução

Whisper recebe o contexto e executa `whisper/scripts/transcribe.ps1` uma vez. O helper assume start, submissão, espera e consulta final. Se a plataforma devolver uma sessão de execução, Whisper acompanha essa sessão.

## Saída esperada

- Sucesso: `job_id`, estado e caminhos do TXT, SRT, segmentos e metadados.
- Prazo de espera esgotado: identificador para acompanhar o mesmo trabalho; a transcrição pode continuar.
- Falha: código/mensagem e motivo operacional conhecido, sem prometer sucesso ou criar outra transcrição automaticamente.

## Retorno ao fluxo original

O agente chamador recebe a saída e continua a tarefa atual. Quando houver pedido de ata, resumo ou decisões, lê o TXT nessa etapa. O framework não copia as falas para seus próprios documentos ou commits por padrão.

## Critérios de prontidão

- Existe mídia ou identificador suficiente para executar.
- Nenhum loop manual de comandos é transferido ao usuário.
- O resultado é validado pelo sistema antes do handoff de sucesso.
