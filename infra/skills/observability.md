# Skill: Observability

## Quando usar
Use esta skill para definir sinais mínimos de saúde, diagnóstico e acompanhamento operacional quando o sistema precisar ser observado além de logs brutos.

## Padrão Sênior
- Começar pelas perguntas operacionais que o time precisa responder.
- Definir métricas, traces e healthchecks proporcionais ao risco do sistema.
- Priorizar visibilidade útil sobre stack sofisticada sem uso real.
- Correlacionar sinais de aplicação, infraestrutura e fluxo crítico quando houver valor.
- Tornar incidentes mais rápidos de detectar e entender.

## Checklist Base
- Healthchecks com semântica clara.
- Métricas mínimas de erro, latência e disponibilidade.
- Rastro suficiente para fluxos críticos quando necessário.
- Dashboard ou consulta simples para os sinais mais usados.
- Critérios objetivos de falha e degradação conhecidos pelo time.

## O que evitar
- Stack grande de observabilidade sem owner ou sem consulta real.
- Métrica coletada sem hipótese de uso.
- Healthcheck que sempre retorna sucesso.
- Tracing completo em sistema que mal tem logs úteis.
- Investir em painel bonito antes de definir pergunta operacional.

## Referências
- [OpenTelemetry Docs](https://r.jina.ai/http://https://opentelemetry.io/docs/)
- [Grafana Documentation](https://r.jina.ai/http://https://grafana.com/docs/)
- [Grafana Loki Docs](https://r.jina.ai/http://https://grafana.com/docs/loki/latest/)

