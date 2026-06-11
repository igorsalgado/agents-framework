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

## Sub-agente especializado: `qa-browserd`

Quando a validação envolver fluxos de browser (E2E em PWS, Agility, Unify, Time2), o `qa-engineer`
pode delegar a execução de testes para o agente `qa-browserd`.

**Como usar:**
1. Passe o contexto da feature + o arquivo de ticket (`test-spec.md` ou equivalente) para o `qa-browserd`.
2. O agente escreve o spec no formato browserd (`browserd/spec/testes/NN-<slug>-<app>.md`), executa e devolve o sumário estruturado.
3. O `qa-engineer` consolida o sumário no test-plan ou bug report habitual.

**Referência do agente:** `qa-browserd/agent.md`
**Templates disponíveis:** `qa-browserd/templates/test-spec.md`, `qa-browserd/templates/run-summary.md`
