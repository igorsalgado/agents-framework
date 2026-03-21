# Handoff: QA to Code Review

Protocolo de passagem da validação funcional para a revisão técnica final da mudança.

## Entrada mínima
1. Branch, commit ou PR acessível para inspeção
2. Evidência objetiva do QA ou explicação clara do que foi validado e do que ficou pendente
3. Contexto sobre onde o risco está concentrado na mudança

## Saída esperada
1. Achados priorizados por severidade
2. Recomendação clara de merge, ressalva ou solicitação de mudanças
3. Registro opcional de revisão em `code-reviewer/reviews/<feature>.md`

## Artifact opcional
- `code-reviewer/reviews/<feature>.md` quando a mudança tiver risco arquitetural, de segurança ou de regressão que justifique rastreabilidade formal.

## Definition of Ready
- [ ] O diff da mudança está acessível
- [ ] Existe evidência mínima do que já foi validado em QA
- [ ] O reviewer consegue identificar o fluxo crítico sem adivinhação excessiva
