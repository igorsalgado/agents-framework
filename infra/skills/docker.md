# Skill: Docker

## Quando usar
Use esta skill para empacotar aplicações, padronizar runtime e reduzir diferença entre ambientes de desenvolvimento, homologação e entrega.

## Padrão Sênior
- Construir imagens pequenas, legíveis e previsíveis.
- Tornar dependências, portas, volumes, variáveis e comando de execução explícitos.
- Separar build de runtime quando isso reduzir tamanho, risco ou acoplamento.
- Usar container para padronizar execução, não para esconder problema de arquitetura.
- Otimizar para onboarding, debug e repetibilidade operacional.

## Checklist Base
- Imagem coerente com o runtime real.
- Dockerfile claro e sem etapas desnecessárias.
- Variáveis e secrets fora do código.
- Healthcheck e logs disponíveis quando fizer sentido.
- Processo simples para build, run e diagnóstico.

## O que evitar
- Imagem inchada sem necessidade.
- Multi-stage ornamental sem ganho real.
- Secrets hardcoded.
- Container que "sobe" mas não fica operacional.
- Empacotamento complexo que só o autor entende.

## Referências
- [Docker Overview](https://r.jina.ai/https://docs.docker.com/get-started/docker-overview/)
- [Dockerfile Reference](https://r.jina.ai/https://docs.docker.com/reference/dockerfile/)
- [Docker Build Best Practices](https://r.jina.ai/https://docs.docker.com/build/building/best-practices/)

