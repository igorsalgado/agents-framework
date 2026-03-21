# Skill: Service Architecture

## Quando usar
Use esta skill para estruturar serviços Python com fronteiras claras de domínio, aplicação, infraestrutura e interface.

## Padrão Sênior
- Delimitar responsabilidades por capacidade de negócio.
- Aplicar DDD de forma pragmática: entidades, value objects e use cases só quando agregarem clareza real.
- Isolar dependências externas e pontos de falha.
- Separar transporte HTTP, casos de uso, domínio e persistência.
- Usar patterns como Repository, Unit of Work ou Strategy apenas quando reduzirem acoplamento ou complexidade operacional.

## Estrutura Recomendada
- Contexto e responsabilidade do serviço.
- Casos de uso explícitos.
- Entidades e invariantes do domínio.
- Adaptadores de infraestrutura claramente isolados.
- Configuração, secrets e ambientes externos ao código.
- Plano mínimo de logs, observabilidade e recuperação.

## O que evitar
- Serviço com múltiplas responsabilidades sem fronteira clara.
- Acoplamento implícito via acesso lateral ao banco ou cache.
- Camadas artificiais que só aumentam cerimônia.
- Configuração hardcoded.
- Fila, evento ou pattern usado para esconder design ruim.

## Referências
- [The Twelve-Factor App](https://r.jina.ai/http://https://12factor.net/)
- [Docker Overview](https://r.jina.ai/http://https://docs.docker.com/get-started/docker-overview/)
- [OpenTelemetry Docs](https://r.jina.ai/http://https://opentelemetry.io/docs/)
