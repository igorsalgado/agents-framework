# Skill: Postman

## Quando usar
Use esta skill para explorar, validar e documentar APIs quando coleções e cenários de contrato precisarem ser compartilhados com QA, backend e consumidores da API.

## Padrão Sênior
- Usar Postman para acelerar exploração e validar comportamento de contrato.
- Organizar coleções por fluxo de negócio ou domínio, não por caos incremental.
- Parametrizar ambiente, autenticação e dados variáveis de forma explícita.
- Transformar cenários críticos repetitivos em execuções reproduzíveis.
- Usar Newman quando a coleção precisar entrar em pipeline ou regressão recorrente.

## Checklist Base
- Coleção com escopo claro.
- Ambientes e variáveis previsíveis.
- Casos positivos e negativos importantes.
- Scripts de validação apenas quando agregarem legibilidade e valor.
- Evidência útil para reproduzir falhas e comparar ambientes.

## O que evitar
- Coleção gigante sem organização por fluxo.
- Testes em Postman duplicando sem critério o que já está melhor coberto em código.
- Ambientes manuais e frágeis.
- Scripts complexos demais dentro da ferramenta.
- Tratar execução manual repetitiva como estratégia suficiente.

## Referências
- [Postman Docs Overview](https://r.jina.ai/http://https://learning.postman.com/docs/introduction/overview/)
- [Postman Collections](https://r.jina.ai/http://https://learning.postman.com/docs/collections/using-collections/)
- [Newman](https://r.jina.ai/http://https://learning.postman.com/docs/collections/using-newman-cli/overview/)

