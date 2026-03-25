# Skill: Logging and Observability

## Quando usar
Use esta skill para definir logs, sinais mínimos de saúde e telemetria útil para diagnóstico.

## Padrão Sênior
- Todo serviço deve emitir sinais suficientes para explicar o que aconteceu.
- Log deve servir para responder perguntas operacionais reais.
- Observabilidade mínima é melhor que stack complexa sem uso.
- Correlacione logs, erros e healthchecks sempre que possível.

## Checklist Base
- Logs estruturados ou pelo menos consistentes.
- Mensagens com contexto de request, erro e serviço.
- Healthcheck por serviço.
- Métricas básicas de erro e latência.
- Processo simples para inspecionar incidentes.

## O que evitar
- Log verboso e inútil.
- Observabilidade sem owner ou sem consulta real.
- Ferramenta complexa antes de processo mínimo.
- Silenciar erro para “limpar log”.

## Referências
- [Python Logging](https://r.jina.ai/https://docs.python.org/3/library/logging.html)
- [OpenTelemetry Docs](https://r.jina.ai/https://opentelemetry.io/docs/)
- [Grafana Loki Docs](https://r.jina.ai/https://grafana.com/docs/loki/latest/)
