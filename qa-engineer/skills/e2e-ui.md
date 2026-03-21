# Skill: E2E UI

## Quando usar
Use esta skill para proteger jornadas críticas de negócio e validar integração real entre interface, backend e navegador.

## Padrão Sênior
- Automatizar apenas fluxos que representam risco relevante.
- Construir testes estáveis, legíveis e independentes.
- Tratar dados de teste, autenticação e sincronização como parte da arquitetura do teste.
- Cobrir o fluxo principal e os desvios que realmente quebram valor.

## Boas Práticas
- Seletores orientados a papel e acessibilidade.
- Esperas baseadas em condição observável.
- Dados controlados por fixture ou seed.
- Isolamento entre cenários.

## O que evitar
- Teste E2E para tudo.
- Dependência de timing fixo.
- Seletores frágeis ligados a layout.
- Cenários gigantes com múltiplas causas de falha.

## Referências
- [Playwright Intro](https://r.jina.ai/http://https://playwright.dev/docs/intro)
- [Playwright Best Practices](https://r.jina.ai/http://https://playwright.dev/docs/best-practices)
- [WAI ARIA APG](https://r.jina.ai/http://https://www.w3.org/WAI/ARIA/apg/)