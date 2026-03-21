# Skill: Performance Quality

## Quando usar
Use esta skill para validar tempo de resposta, estabilidade, capacidade, experiência percebida e regressões de performance.

## Padrão Sênior
- Relacionar performance com experiência do usuário e custo operacional.
- Definir baseline antes de declarar regressão.
- Medir camada certa: frontend, API, banco ou infraestrutura.
- Tratar performance como requisito de qualidade contínua.

## Estrutura Recomendada
- Cenário de carga ou uso.
- Métricas-alvo.
- Ambiente e dados.
- Gargalos observados.
- Recomendação e próximos passos.

## O que evitar
- Comparar execuções sem ambiente controlado.
- Usar média como única métrica.
- Testar carga sem hipótese.
- Confundir lentidão local com limite sistêmico.

## Referências
- [Grafana k6 Docs](https://r.jina.ai/http://https://grafana.com/docs/k6/latest/)
- [Chrome Lighthouse Overview](https://r.jina.ai/http://https://developer.chrome.com/docs/lighthouse/overview/)
- [web.dev: Core Web Vitals](https://r.jina.ai/http://https://web.dev/articles/vitals)