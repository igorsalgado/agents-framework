# Skill: API Design

## Quando usar
Use esta skill para projetar ou revisar APIs HTTP em um contexto API-first, spec-driven e Python-first.

## Padrão Sênior
- Definir o contrato antes da implementação.
- Tratar OpenAPI como fonte de alinhamento entre produto, frontend, backend e QA.
- Modelar recursos, comandos, erros, autenticação e paginação de forma consistente.
- Garantir idempotência onde houver retry, processamento assíncrono ou efeito colateral.
- Escolher FastAPI ou Django com base no contexto, sem forçar framework.

## Checklist Base
- Request e response com schema claro e explícito.
- Códigos HTTP coerentes com o comportamento.
- Estratégia de autenticação, autorização e rate limiting.
- Erros previsíveis, com código interno e mensagem útil.
- Paginação, filtros, ordenação e defaults explícitos.
- Critérios de compatibilidade e evolução da API.

## O que evitar
- Endpoint “faz tudo”.
- Misturar erro de negócio com erro técnico.
- Payload opaco sem contrato, exemplo ou semântica estável.
- Começar pelo controller e “descobrir” a API no meio da implementação.
- Quebra de compatibilidade sem plano de migração.

## Referências
- [OpenAPI Specification](https://r.jina.ai/http://https://spec.openapis.org/oas/latest.html)
- [FastAPI Tutorial](https://r.jina.ai/http://https://fastapi.tiangolo.com/tutorial/)
- [Django Documentation](https://r.jina.ai/http://https://docs.djangoproject.com/en/stable/)
- [RFC 9110: HTTP Semantics](https://r.jina.ai/http://https://www.rfc-editor.org/rfc/rfc9110.html)
- [OWASP ASVS](https://r.jina.ai/http://https://owasp.org/www-project-application-security-verification-standard/)
