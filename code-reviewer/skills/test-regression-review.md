# Skill: Test and Regression Review

## Quando usar
Use esta skill para avaliar se a mudança está protegida por testes proporcionais ao risco e se ainda existem regressões prováveis sem cobertura.

## Padrão Sênior
- Conferir se os testes protegem o comportamento alterado, não apenas a implementação atual.
- Verificar cenários de erro, vazio, permissão, compatibilidade e rollback quando aplicável.
- Cruzar achados do diff com a evidência de QA e com a automação existente.
- Tratar ausência de teste como risco quando a mudança afeta comportamento crítico.

## Perguntas Práticas
- O fluxo alterado falharia em produção sem um teste dedicado?
- Existe caso de regressão óbvia ainda não coberto?
- A evidência atual protege contrato, estado extremo e dados sensíveis?
- O teste proposto é barato de manter e realmente detecta a falha?

## O que evitar
- Pedir teste para código trivial sem risco real.
- Aceitar cobertura numérica como proxy de proteção comportamental.
- Ignorar impacto de migração, compatibilidade ou integração.
- Tratar QA manual como substituto permanente de automação em fluxo crítico.

## Referências
- [Pytest Documentation](https://r.jina.ai/https://docs.pytest.org/en/stable/)
- [Vitest Guide](https://r.jina.ai/https://vitest.dev/guide/)
- [Google Testing Blog](https://r.jina.ai/https://testing.googleblog.com/)
