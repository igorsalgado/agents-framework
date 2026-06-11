# Skill: Operação do Runner

## Quando usar

Use esta skill para operar o `bin/runspec` com segurança: preflight, dry-run, execução,
leitura de relatório e interpretação de exit codes. Aplica-se a qualquer run no browserd.

## Sequência obrigatória antes de executar

```
1. npm run status          → daemon respondendo? (deve retornar ok: true)
2. npm run ps              → containers browser e ollama estão Up?
3. npm run spec -- <path> --dry-run   → spec válido? preflight OK?
```

Se qualquer passo falhar, não prossiga para a execução real. Diagnostique primeiro.

## Exit codes do dry-run

| Código | Diagnóstico | Ação |
|---|---|---|
| `0` | Tudo OK | Prosseguir |
| `2` | Spec inválido | Corrigir frontmatter ou cenários — ver `spec-writing.md` |
| `3` | Preflight falhou | Verificar daemon (`npm run status`), Ollama (`npm run ps`), DB se spec usa `db` |

## Execução

```powershell
npm run spec -- spec/testes/NN-<slug>.md
```

O comando bloqueia até o runner sair. **Não interrompa** — um SIGINT gera exit `4` (abortado)
e pode deixar fixtures não limpas (`fixtures.leaked` não estará vazio).

**Opções úteis:**

| Flag | Quando usar |
|---|---|
| `--scenario C2` | Reexecutar apenas um cenário que falhou |
| `--no-teardown` | Debug: inspecionar o estado pós-execução sem limpar |
| `--max-steps 90` | Spec complexo que está retornando `blocked` por orçamento |
| `--model llama3.2:3b` | Override do modelo para teste rápido |

## Lendo o relatório

Após o run:

```powershell
# Encontrar o run mais recente
$runId = (Get-ChildItem browserd/runs | Sort-Object LastWriteTime -Descending | Select-Object -First 1).Name

# Campos críticos no report.json
aggregate_verdict   → pass | fail | blocked
counts              → { pass, fail, blocked }
scenarios[]         → { key, verdict, reason, evidence[] }
findings[]          → { kind: network|console_error|text, ... }
fixtures.leaked     → lista de usuários qa_ não removidos
exit_code           → 0 | 1 | 4 | 5
```

## Interpretando os veredictos

| Veredicto | Significado | O que fazer |
|---|---|---|
| `pass` | Todos os "Então" confirmados por evidência | Reportar ao chamador |
| `fail` | Um "Então" observavelmente não foi cumprido | Bug real — incluir findings e evidence no sumário |
| `blocked` | LLM não conseguiu completar o cenário | Ver `llm-steering.md` para diagnóstico |

## Fixtures vazadas

Se `fixtures.leaked` não estiver vazio após o run:
1. O teardown falhou silenciosamente ou foi interrompido.
2. Executar limpeza manual: `DELETE FROM <table> WHERE email LIKE 'qa_%@test.local'`
3. Alertar o agente chamador — dados de teste ficaram no banco.

## Anti-padrões

- Executar sem `--dry-run` e descobrir spec inválido no meio do run.
- Interromper o run no meio com Ctrl+C — deixa o browser em estado sujo e fixtures no banco.
- Ignorar `blocked` como se fosse `pass` — orçamento esgotado não é evidência de funcionamento.
- Ler apenas `aggregate_verdict` sem checar `findings[]` e `fixtures.leaked`.
