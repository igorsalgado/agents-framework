# Skill: Escrita de Test-Spec

## Quando usar

Use esta skill ao converter requisitos, critérios de aceite ou descrições de fluxo em
test-specs válidos para o browserd. Aplica-se tanto a specs novos quanto à revisão de
specs existentes em `browserd/spec/testes/`.

## Contrato de referência

O formato completo está em `browserd/docs/qa/contract.md`.
O exemplo anotado está em `browserd/docs/qa/example.md`.

## Padrões

**Nomenclatura de arquivo:**
`NN-<slug-curto>-<app>.md` onde `NN` é o próximo número sequencial com dois dígitos.
Descubra o número atual com: `Get-ChildItem browserd/spec/testes/*.md | Sort-Object Name | Select-Object -Last 1`

**Frontmatter obrigatório:**
```yaml
id: <kebab-case único>
title: <descrição curta>
target: pws | agility | unify | time2
base_url: https://<app>.localhost
session_prefix: <prefix>_
db:                         # só se o spec precisa de banco
  schema: <nome-do-banco>
  marker: "qa_"
  email_domain: test.local
budget:
  max_steps: 60
  max_minutes: 15
```

**Divisão de specs:**
- Máximo de 5-6 cenários por arquivo.
- Não misture perfis de usuário distintos (admin + categoria específica) no mesmo spec.
- Prefira múltiplos specs focados a um spec longo com muitas causas de falha possíveis.

**Cenários verificáveis:**
Cada "Então" deve mapear para um verbo `browse` concreto:

| Critério | Verbo |
|---|---|
| URL contém `/path` | `eval location.href` ou `eval location.pathname` |
| Cookie presente | `cookies <prefix>` |
| Texto visível | `text <selector>` ou `eval` |
| Lista tem N itens | `eval document.querySelectorAll('tr').length` |
| URL não contém parâmetro | `eval location.search` |
| Request foi POST | `network <url-filter>` → checar `method` |
| Flash de erro | `text .flash-error` ou `eval` |
| Status HTTP da resposta | `network --status 500` |
| Sem erros de console | `console --type error` |

**Fixtures de banco:**
- Toda conta de teste deve ser criada via `db.seed-user` com credenciais marcadas (`qa_`).
- Se a conta já existe no banco (ex.: contas de categoria específica), consulte antes:
  `SELECT id, username, category_id FROM users WHERE category_id IN (...) AND active=1 LIMIT 5`
  e documente nos campos `Fixtures` e `Pré-condições` o que foi encontrado.

## Anti-padrões

- "Então a página deve parecer correta" — não é verificável. Especifique o que exatamente verificar.
- Cenário sem `Evidence: save <nome>` para fluxos críticos — sem evidence o run não gera artefatos.
- Misturar login e fluxo funcional no mesmo cenário longo — cria múltiplas causas possíveis de falha.
- `base_url` com HTTP quando o app usa HTTPS — verificar `browserd/docs/qa/apps.md`.
- Omitir `db.marker` quando o spec cria dados — o teardown não consegue limpar sem ele.

## Critérios práticos

- O spec pode ser lido por um humano e entendido sem contexto adicional.
- Todo cenário tem `Given / When / Then` explícitos — nenhuma etapa implícita.
- O `Teardown` lista exatamente o que será removido.
- `--dry-run` passa antes de considerar o spec pronto.
