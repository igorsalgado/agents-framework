# Template: Run Summary

Use este template para estruturar o retorno ao agente chamador após a execução de um spec.
Preencha a partir do `runs/<run-id>/report.json` — nunca invente campos não presentes no JSON.

## Instruções de uso

1. Localize o run mais recente: `Get-ChildItem browserd/runs | Sort-Object LastWriteTime -Descending | Select-Object -First 1`
2. Leia `report.json` para os campos estruturados e `report.md` para o sumário gerado pelo LLM local.
3. Preencha o esqueleto abaixo com os dados reais.
4. Se `aggregate_verdict` for `fail`, inclua `findings` e o path do `report.md` para leitura detalhada.
5. Se `fixtures.leaked` não estiver vazio, alerte explicitamente.

## Esqueleto

```
spec_path: browserd/spec/testes/NN-<slug>.md
run_id: <run-id>
aggregate_verdict: pass | fail | blocked
counts:
  pass: N
  fail: N
  blocked: N

scenarios:
  C1 — <título>: pass | fail | blocked
    reason: <o que o LLM observou para chegar a este veredicto>
  C2 — <título>: pass | fail | blocked
    reason: <...>

findings:
  network:
    - <METHOD> <URL> → <STATUS>   # ex.: POST /applicants/index/1 → 500
  console:
    - <mensagem de erro JS>        # ex.: Uncaught TypeError: filter is not a function
  [Omitir seção se findings estiver vazio]

fixtures:
  created: [qa_tester01, ...]
  torn_down: [qa_tester01, ...]
  leaked: []   # ALERTA se não estiver vazio — dados qa_ remanescentes no banco

report_path: browserd/runs/<run-id>/report.md
```

## Checklist de qualidade

- [ ] `aggregate_verdict` reflete o `exit_code` do runner (0→pass, 1→fail, 5→blocked)
- [ ] Cada cenário com `fail` tem `reason` extraído do `scenarios[].reason` do JSON (não inventado)
- [ ] `findings.network` lista apenas requests com `status >= 400` vindos do `findings[]` do JSON
- [ ] `findings.console` lista apenas entradas com `kind: console_error` do `findings[]` do JSON
- [ ] `fixtures.leaked` está vazio — se não estiver, o sumário inclui alerta explícito
- [ ] `report_path` aponta para o arquivo real que o chamador pode ler para detalhe completo
- [ ] Distinção clara entre `fail` (bug confirmado) e `blocked` (infra ou orçamento) no texto
