# Solicitação ao Whisper

Use como entrada opcional quando o agente chamador precisar organizar o pedido. Se o caminho já estiver na conversa, não exigir um documento adicional.

```text
Whisper, transcreva a gravação indicada e devolva os caminhos da saída.
Gravação: caminho absoluto da mídia finalizada
Idioma: pt (ou escolha explícita do usuário)
Projeto Whisper Box: padrão do ambiente ou caminho alternativo
```

Para retomar, substitua a gravação pelo `job_id` e solicite acompanhamento do mesmo trabalho.

Verifique somente se há caminho ou identificador, acesso local ao projeto e definição da saída posterior quando o usuário pedir análise além da transcrição.
