# Skill: Pytest

## Quando usar
Use esta skill para escrever e organizar testes reproduzíveis em Python com foco em comportamento crítico, integração útil e diagnóstico rápido de falha.

## Padrão Sênior
- Usar pytest para automação que realmente reduz risco recorrente.
- Modelar fixtures para clareza e isolamento, não para esconder setup complexo.
- Testar comportamento observável, não detalhe incidental de implementação.
- Preferir testes pequenos e confiáveis antes de montar pirâmides artificiais.
- Tornar dados, contexto e motivo da falha legíveis no próprio teste.

## Checklist Base
- Casos críticos cobertos com expectativa objetiva.
- Fixtures com escopo coerente e sem acoplamento excessivo.
- Dados de teste previsíveis e reexecutáveis.
- Mensagens de falha e asserts legíveis.
- Separação razoável entre testes unitários, integração e contrato.

## O que evitar
- Fixtures mágicas que escondem dependências importantes.
- Teste frágil acoplado a detalhe interno do código.
- Suite lenta demais para uso cotidiano sem motivo claro.
- Usar mock para mascarar contrato quebrado.
- Automatizar fluxo de baixo valor e deixar risco crítico sem cobertura.

## Referências
- [Pytest Documentation](https://r.jina.ai/https://docs.pytest.org/en/stable/)
- [Pytest Fixtures](https://r.jina.ai/https://docs.pytest.org/en/stable/how-to/fixtures.html)
- [Pytest Good Practices](https://r.jina.ai/https://docs.pytest.org/en/stable/explanation/goodpractices.html)

