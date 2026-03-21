# Tools: Code Reviewer

Stack preferencial para revisão de código pragmática no ecossistema atual.

## Inspeção de Mudança
- `git diff`
- `git show`
- `git blame`
- `rg`

## Validação Técnica
- `pytest`
- `vitest`, `npm test` ou equivalente do projeto frontend
- `ruff`, `mypy`, `pyright`, `eslint` e `tsc` quando a stack usar essas checagens

## Segurança e Operação
- `bandit`
- logs locais, traces e evidências de QA disponíveis
- benchmarks simples ou profiling leve quando houver risco de performance

## Saída da Revisão
- comentários objetivos na PR ou relatório enxuto de revisão
- decisão explícita: aprovar, aprovar com ressalvas ou solicitar mudanças
