# Skill: Review Triage

## Quando usar
Use esta skill para estruturar uma revisão a partir do diff, do contexto da feature e da superfície de risco antes de entrar em detalhes de implementação.

## Padrão Sênior
- Começar pelo comportamento alterado, não por detalhes cosméticos.
- Identificar primeiro o que pode quebrar contrato, dados, segurança ou operação.
- Classificar achados por severidade e probabilidade, não por volume de comentários.
- Registrar somente pontos que mudem a decisão de merge ou reduzam risco relevante.

## Estrutura Recomendada
- Escopo da mudança.
- Áreas de risco.
- Evidência disponível.
- Achados priorizados.
- Decisão final.

## O que evitar
- Ler arquivo por arquivo sem hipótese de risco.
- Abrir muitos comentários menores e deixar passar um problema estrutural.
- Misturar bloqueador com sugestão opcional.
- Revisar sem entender o requisito ou o fluxo validado por QA.

## Referências
- [Google Engineering Practices: The Standard of Code Review](https://r.jina.ai/http://https://google.github.io/eng-practices/review/reviewer/standard.html)
- [Google Engineering Practices: How to Do a Code Review](https://r.jina.ai/http://https://google.github.io/eng-practices/review/reviewer/)
