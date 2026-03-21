# Handoff: Dev to QA

Protocolo de passagem da implementação para validação.

## Entrada mínima
1. Branch, commit ou ambiente de teste acessível
2. Notas objetivas do que mudou e onde o risco está concentrado
3. Confirmação de smoke test básico pelo time de desenvolvimento

## Saída esperada
1. Execução de validação orientada a risco
2. Bug reports, se houver
3. Sinal claro de aprovado, aprovado com ressalva ou reprovado

## Artifact opcional
- `qa-engineer/test-plans/<feature>.md` apenas quando a feature tiver risco relevante, integração sensível ou regressão cara.

## Definition of Ready
- [ ] A mudança está acessível para teste
- [ ] O foco do QA está claro
- [ ] Não falta contexto básico para reproduzir e validar
