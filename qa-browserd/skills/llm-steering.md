# Skill: Direcionamento do LLM Local

## Quando usar

Use esta skill quando um run retornar `blocked`, quando o LLM local repetir ações sem
progredir, quando navegar para a URL errada, ou quando a sequência de observações no
`run.log` sugerir que o modelo não entendeu o cenário.

## Como o LLM local funciona

O runner monta um prompt a cada turno com:
- System prompt completo (`runner/prompt.js`) — papel, schema de tools, regras
- `base_url` do spec
- Corpo do cenário atual (Given/When/Then)
- Passos usados / budget restante
- Histórico de observações anteriores

O LLM emite JSON com `action` ou `final`. O runner executa a action, adiciona a observação
ao histórico e repete. O contrato completo está em `browserd/docs/qa/llm-tools.md`.

## Diagnóstico de `blocked`

Leia o `run.log` (JSONL) para entender onde o LLM travou:

```powershell
# Últimas 30 linhas do journal
Get-Content browserd/runs/<run-id>/run.log -Tail 30
```

Padrões comuns e causas:

| Padrão no log | Causa provável | Solução no spec |
|---|---|---|
| Mesmo `op: nav` repetindo com erro | LLM não sabe a URL correta | Especificar a rota exata no Given/When, ex.: "navegue a `/applicants/index/1`" |
| `SELECTOR_TIMEOUT` repetindo | Seletor não existe na página real | Adicionar ao spec: "use `snapshot` para encontrar o seletor real antes de interagir" |
| `final: blocked` logo no início | Preflight ok mas LLM não entende o cenário | Simplificar o cenário — dividir em dois |
| `final: blocked` após N passos | Orçamento esgotado | Aumentar `max_steps` ou dividir o spec |
| Ação `db` rejeitada com guardrail | SQL sem marcador no WHERE | Corrigir o cenário para incluir o marker nas condições |

## Tuning de budget

Regra prática por complexidade de cenário:

| Tipo de cenário | max_steps recomendado |
|---|---|
| Login simples + 1 verificação | 20–30 |
| Fluxo com filtro + paginação | 40–60 |
| Múltiplas navegações + DB seed | 60–80 |
| Spec com 5+ cenários encadeados | 80–100 |

Se um run retorna `blocked` com menos de 10 passos, o problema é o spec, não o budget.

## Melhorando a qualidade dos cenários para o LLM

O LLM local é literal e tem contexto limitado. Cenários ambíguos geram loops:

**Ruim:**
```
- Quando filtre por nome e pesquise
- Então a lista deve filtrar
```

**Bom:**
```
- Quando preencher o campo `#ApplicantName` com `TESTE_K1` e clicar em `button.filter-search-submit`
- Então `eval document.querySelectorAll('table tbody tr').length` retorna valor maior que 0
- E `eval document.querySelector('#ApplicantName').value` retorna `TESTE_K1`
```

Quanto mais preciso o seletor e a verificação no spec, menos passos o LLM gasta explorando.

## Verificando a saúde do modelo

```powershell
# Modelo disponível?
npm run spec -- spec/testes/01-login-pws.md --dry-run

# Ollama respondendo?
docker compose exec ollama ollama list
```

Se o modelo não estiver disponível: `npm run pull-model`

## Anti-padrões

- Aumentar `max_steps` indefinidamente para mascarar spec mal escrito.
- Ignorar o `run.log` e reexecutar sem diagnóstico — desperdiça orçamento.
- Cenários com múltiplos fluxos misturados — o LLM perde o fio do "Então" principal.
- Especificar verificações que requerem contexto humano ("a tabela parece correta") — o LLM não consegue avaliar.
