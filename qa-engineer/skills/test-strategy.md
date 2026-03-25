# Skill: Test Strategy

## Quando usar
Use esta skill para decidir o que testar, em que camada, com qual profundidade e com qual evidência mínima no stack atual do framework.

## Padrão Sênior
- Priorizar por impacto, frequência, criticidade e detectabilidade.
- Distribuir validação entre pytest, Postman, checagem manual dirigida e scanners complementares.
- Fazer cobertura intencional, não genérica.
- Explicitar riscos aceitos, riscos mitigados e riscos não cobertos.

## Estrutura Recomendada
- Escopo.
- Riscos principais.
- Camadas de teste.
- Ambientes e dados.
- Critérios de entrada e saída.
- Evidências esperadas.

## O que evitar
- Estratégia baseada em ferramenta em vez de risco.
- Cobertura total como objetivo abstrato.
- Critério de pronto sem condição verificável.
- Plano de teste desconectado da arquitetura real.

## Referências
- [OWASP Web Security Testing Guide](https://r.jina.ai/https://owasp.org/www-project-web-security-testing-guide/)
- [Pytest: Getting Started](https://r.jina.ai/https://docs.pytest.org/en/stable/getting-started.html)
- [Postman Docs Overview](https://r.jina.ai/https://learning.postman.com/docs/introduction/overview/)
