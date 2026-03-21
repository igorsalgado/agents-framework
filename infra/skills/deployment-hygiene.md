# Skill: Deployment Hygiene

## Quando usar
Use esta skill para preparar ambientes com configuração clara, rollback simples e operação segura o suficiente para o estágio do projeto.

## Padrão Sênior
- Tornar configuração explícita e auditável.
- Definir o que caracteriza sucesso, falha e recuperação.
- Tratar rollout e rollback como parte da entrega.
- Evitar dependência de passos manuais obscuros.

## Checklist Base
- Variáveis documentadas.
- Ordem de subida conhecida.
- Procedimento de rollback simples.
- Dependências externas identificadas.
- Runbook mínimo disponível.

## O que evitar
- Deploy baseado em memória do operador.
- Mudança irreversível sem plano.
- Ambientes diferentes sem motivo claro.
- Configuração espalhada em múltiplos lugares sem fonte de verdade.

## Referências
- [The Twelve-Factor App](https://r.jina.ai/http://https://12factor.net/)
- [Docker Overview](https://r.jina.ai/http://https://docs.docker.com/get-started/docker-overview/)
- [OpenTelemetry Docs](https://r.jina.ai/http://https://opentelemetry.io/docs/)
