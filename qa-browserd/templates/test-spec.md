# Template: Test-Spec (browserd)

Use este template para criar um novo spec em `browserd/spec/testes/NN-<slug>-<app>.md`.
O contrato completo e as regras de validação estão em `browserd/docs/qa/contract.md`.

## Instruções de uso

1. Copie o esqueleto abaixo para `browserd/spec/testes/NN-<slug>-<app>.md`.
2. Preencha o frontmatter — todos os campos marcados `[OBRIGATÓRIO]` devem ter valor.
3. Escreva cenários onde cada "Então" mapeia para um verbo `browse` verificável.
4. Execute `npm run spec -- <path> --dry-run` e corrija até exit 0 antes de rodar de verdade.

## Esqueleto

```markdown
---
id: [OBRIGATÓRIO: kebab-case único — ex.: filtro-candidatos-pws-001]
title: [OBRIGATÓRIO: descrição curta do que este spec valida]
target: [OBRIGATÓRIO: pws | agility | unify | time2]
base_url: [OBRIGATÓRIO: https://<app>.localhost]
session_prefix: [OBRIGATÓRIO: ver browserd/docs/qa/apps.md]
db:                              # remover bloco se o spec não usar banco
  schema: [nome-do-banco]
  marker: "qa_"
  email_domain: test.local
budget:
  max_steps: 60
  max_minutes: 15
tags: [lista livre de rótulos]
---

## Objective
[Por que este spec existe e o que ele prova ou derruba.
O LLM local lê esta seção para resolver ambiguidades durante a execução.]

## Pre-conditions
[Estado que deve existir antes de começar.
Ex.: "App no ar; Redis ativo; nenhum usuário qa_ remanescente."]

## Fixtures
[Dados a criar antes dos cenários — sempre marcados com qa_.
- Usuário `qa_tester01` / email `qa_tester01@test.local` / senha `Test@123` / papel operador
Omitir seção se o spec não criar dados.]

## Scenarios

### C1 — [Título do cenário]
- **Given** [estado inicial observável]
- **When** [ação concreta com seletor e valor, ex.: preencho `#ApplicantName` com `TESTE` e clico em `button.filter-search-submit`]
- **Then** [resultado verificável — ex.: `eval document.querySelectorAll('tbody tr').length` > 0]
- **Evidence:** save [nome-do-pacote-de-evidencia]
- **Observability:** sem erros de console; nenhum request >= 500

### C2 — [Título do cenário]
- **Given** [estado — se depende de C1, declare explicitamente "C1 passou"]
- **When** [ação]
- **Then** [verificação]

[Adicionar cenários CN conforme necessário. Máximo 5-6 por spec.]

## Teardown
[O que remover ao final, independente de sucesso.
Ex.: DELETE qa_tester01; clearcookies.
Omitir se o spec não criou dados.]

## Acceptance criteria
[Condições globais para o spec ser "passou".
Ex.: C1 e C2 passam; nenhum erro de console inesperado; nenhum 5xx.]
```

## Checklist de qualidade

- [ ] `id` é único — não colide com specs existentes em `browserd/spec/testes/`
- [ ] Todos os "Então" são verificáveis por verbo `browse` (sem critérios subjetivos)
- [ ] Fixtures usam prefixo `qa_` em username, email e qualquer dado criado
- [ ] Cenários com dependência entre si declaram "Given C1 passou" explicitamente
- [ ] Specs que testam perfis de usuário distintos estão em arquivos separados
- [ ] `budget.max_steps` está dimensionado para a complexidade real (ver `llm-steering.md`)
- [ ] `npm run spec -- <path> --dry-run` retorna exit 0
