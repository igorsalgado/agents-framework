# Skill: FastAPI

## Quando usar
Use esta skill para APIs HTTP orientadas a contrato, com OpenAPI explícito, validação por schema e boa produtividade em serviços Python.

## Padrão Sênior
- Definir request, response e erros antes de abrir o router.
- Manter router fino e deslocar regra de negócio para casos de uso ou serviços claros.
- Usar `Depends` para fronteiras explícitas, não para esconder fluxo complexo.
- Tratar `async` como decisão de stack inteira, não apenas de endpoint.
- Aproveitar OpenAPI como contrato para frontend, QA e integração externa.

## Checklist Base
- Schemas de entrada e saída explícitos.
- Código de status coerente com o comportamento.
- Dependências externas isoladas atrás de interfaces claras.
- Tratamento padronizado de erro e validação.
- Testes de contrato e integração para fluxos críticos.

## O que evitar
- Regra de negócio diretamente no endpoint.
- `Depends` encadeado demais sem legibilidade.
- Misturar caminho síncrono e assíncrono sem entender impacto.
- Retornar payload sem schema ou sem semântica estável.
- Criar uma aplicação gigante sem modularidade por domínio.

## Referências
- [FastAPI Tutorial](https://r.jina.ai/https://fastapi.tiangolo.com/tutorial/)
- [FastAPI Bigger Applications](https://r.jina.ai/https://fastapi.tiangolo.com/tutorial/bigger-applications/)
- [Pydantic Documentation](https://r.jina.ai/https://docs.pydantic.dev/latest/)
