# Tools: QA Browserd

Stack operacional do agente qa-browserd no workspace atual.

## Serviço de browser

- **browserd** — daemon Node.js + Playwright em container Docker; controle via verbos `browse`
- **Projeto:** `C:\Users\Igor Andrade\Desktop\Dev\browserd`
- **Docs operacionais:** `browserd/docs/qa/` (contract, commands, apps, llm-tools, example)

## LLM local (executor de cenários)

- **Ollama** — sidecar no compose do browserd; expõe `/api/generate` e `/api/tags`
- **Modelo padrão:** `qwen2.5-coder:7b` (configurável via `OLLAMA_MODEL`)
- **System prompt:** `browserd/runner/prompt.js` — contrato de tools e formato de resposta do LLM

## Runner

- **`bin/runspec`** — orquestrador: preflight → setup → loop ReAct → teardown → relatório
- **Entrada:** test-spec Markdown com frontmatter YAML (`browserd/spec/testes/NN-*.md`)
- **Saída:** `runs/<run-id>/` com `report.json`, `report.md`, `run.log`, `meta.json`

## Comandos de ciclo de vida

Todos via `npm run` a partir de `browserd/`:

| Comando | Ação |
|---|---|
| `npm run up` | Sobe browser + ollama |
| `npm run pull-model` | Baixa o modelo Ollama |
| `npm run status` | Verifica saúde do daemon |
| `npm run spec -- <path>` | Executa um test-spec |
| `npm run spec -- <path> --dry-run` | Valida spec sem executar |
| `npm run clean` | Remove volumes (fix de userdata travado) |

## Banco de dados (tool `db` do runner)

- **mysql2** — driver embutido no runner; conexão configurada via `DB_USER` / `DB_PASSWORD` no compose
- Usado apenas para `seed-user`, `query`, `exec`, `cleanup` — todos com guardrails de marcador

## Testes unitários do runner

- **node:test** (nativo Node 20) — suíte em `browserd/test/unit/`
- Comando: `npm test` a partir de `browserd/`
- Cobre: guardrails de DB (`execDb`), redação de segredos (`Journal.redact`)
