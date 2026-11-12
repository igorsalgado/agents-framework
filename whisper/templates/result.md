# Retorno do Whisper

Use para devolver o resultado ao agente chamador sem copiar a transcrição para a conversa.

```text
Trabalho: identificador retornado
Estado: succeeded, failed ou estado observado ao esgotar a espera
Texto: caminho retornado em files.text, quando concluído
Legendas: caminho retornado em files.srt, quando concluído
Segmentos e metadados: caminhos retornados, quando concluído
Falha ou retomada: motivo e job_id, quando aplicável
```

Confirme que sucesso corresponde ao código `0` com os quatro caminhos. Preserve o identificador para consultas posteriores e deixe análise, ata ou tarefas com o agente chamador.
