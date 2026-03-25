# Skill: Docker Runtime

## Quando usar
Use esta skill para empacotar serviços, compor ambientes locais e garantir execução reproduzível.

## Padrão Sênior
- Construir imagens pequenas, legíveis e previsíveis.
- Declarar portas, volumes, variáveis e healthchecks explicitamente.
- Usar Compose para orquestração local simples.
- Otimizar para onboarding, debug e repetibilidade.

## Checklist Base
- Dockerfile claro e sem etapas desnecessárias.
- Compose com serviços, dependências e redes explícitas.
- Variáveis externas ao código.
- Healthcheck configurado.
- Logs acessíveis por container.

## O que evitar
- Imagem inchada sem necessidade.
- Compose que só o autor entende.
- Secrets hardcoded.
- Container “sobe” mas não fica operacional.

## Referências
- [Docker Overview](https://r.jina.ai/https://docs.docker.com/get-started/docker-overview/)
- [Docker Compose File Reference](https://r.jina.ai/https://docs.docker.com/compose/compose-file/)
- [The Twelve-Factor App](https://r.jina.ai/https://12factor.net/)
