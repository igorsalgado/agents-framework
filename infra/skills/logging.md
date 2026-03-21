# Skill: Logging

## Quando usar
Use esta skill para definir estratégia de logs que permita entender comportamento, falha e degradação de serviços sem depender de leitura ad hoc do código.

## Padrão Sênior
- Logar para responder perguntas operacionais reais.
- Garantir contexto suficiente para correlacionar evento, request, serviço e erro.
- Preferir estrutura consistente a volume alto de mensagens.
- Tornar nível de log e formato coerentes com o estágio do projeto.
- Usar logs como fonte de diagnóstico, não como substituto de métrica, tracing ou teste.

## Checklist Base
- Campos mínimos de contexto definidos.
- Níveis de log usados com critério.
- Erros registrados com informação acionável.
- Caminho simples para inspeção local e em ambiente compartilhado.
- Política clara para não vazar dado sensível em log.

## O que evitar
- Log verboso e inútil.
- Mensagem sem contexto de operação.
- Silenciar erro para "limpar log".
- Registrar dado sensível sem necessidade.
- Tornar troubleshooting dependente de prints arbitrários e não padronizados.

## Referências
- [The Twelve-Factor App: Logs](https://r.jina.ai/http://https://12factor.net/logs)
- [Docker: Configure Logging Drivers](https://r.jina.ai/http://https://docs.docker.com/engine/logging/configure/)
- [OpenTelemetry Logs](https://r.jina.ai/http://https://opentelemetry.io/docs/concepts/signals/logs/)

