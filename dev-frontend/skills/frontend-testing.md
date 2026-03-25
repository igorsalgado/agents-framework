# Skill: Frontend Testing

## Quando usar
Use esta skill para validar comportamento de interface em Vue ou Streamlit, integração com API e regressões em fluxos críticos.

## Padrão Sênior
- Testar comportamento observável antes de detalhes internos.
- Cobrir fluxos críticos, estados extremos e regressões recorrentes.
- Em Vue, usar testes de componente e integração leves.
- Em Streamlit, priorizar smoke tests, validação funcional e cobertura manual bem direcionada.
- Reservar E2E para jornadas realmente críticas.

## Estrutura Recomendada
- Testes de componente e interação em Vue.
- Smoke tests e checagens funcionais em apps Streamlit.
- Testes de integração por fluxo importante.
- E2E apenas para jornadas sensíveis.
- Estratégia de dados de teste previsível.

## O que evitar
- Snapshot como substituto de análise.
- Teste acoplado a detalhes de implementação.
- E2E cobrindo tudo e falhando por instabilidade.
- Cobertura “bonita” sem proteger comportamento relevante.

## Referências
- [Vitest Guide](https://r.jina.ai/https://vitest.dev/guide/)
- [Vue Test Utils](https://r.jina.ai/https://test-utils.vuejs.org/)
- [Playwright Intro](https://r.jina.ai/https://playwright.dev/docs/intro)
- [Streamlit Documentation](https://r.jina.ai/https://docs.streamlit.io/)
