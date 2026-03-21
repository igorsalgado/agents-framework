# Skill: API Testing

## Quando usar
Use esta skill para validar contratos, autenticação, tratamento de erro, compatibilidade e comportamento de APIs em um stack centrado em Python.

## Padrão Sênior
- Validar o contrato nominal e também comportamentos adversos.
- Usar Postman para explorar, documentar e executar coleções de contrato.
- Usar pytest para automação repetível em cenários críticos.
- Testar limites, autenticação, autorização, paginação, filtros e idempotência.
- Cobrir erro e degradação, não só respostas 200.

## Checklist Base
- Casos positivos e negativos.
- Erros de validação e autorização.
- Compatibilidade de schema.
- Respostas parciais, timeout e retry.
- Dados de teste previsíveis e reexecutáveis.

## O que evitar
- Teste manual repetitivo sem ganho.
- Coleção Postman sem objetivo claro.
- Casos sem expectativa objetiva.
- Mock mascarando contrato quebrado.
- Testar só o happy path.

## Referências
- [Postman Docs Overview](https://r.jina.ai/http://https://learning.postman.com/docs/introduction/overview/)
- [Pytest: Getting Started](https://r.jina.ai/http://https://docs.pytest.org/en/stable/getting-started.html)
- [FastAPI Testing](https://r.jina.ai/http://https://fastapi.tiangolo.com/tutorial/testing/)
- [OWASP Web Security Testing Guide](https://r.jina.ai/http://https://owasp.org/www-project-web-security-testing-guide/)
