# Guia: Fluxos de Validação

Este guia descreve como os gates do framework funcionam na prática e quando cada script deve ser usado.

## Objetivo
- Garantir que o próximo agente só comece quando houver insumo mínimo real.
- Validar artifacts de transição, não templates técnicos genéricos.
- Reduzir handoffs ambíguos sem criar burocracia desnecessária.

## Scripts Envolvidos
- `scripts/validate_artifacts.py`
- `scripts/validate_handoff.py`

## O que é validado

### `validate_artifacts.py`
Use para validar artifacts reais de transição.

Tipos suportados:
- `user_story`
- `component_spec`
- `user_flow`
- `test_plan`
- `bug_report`
- `review_report`

O script verifica:
- se o arquivo existe;
- se as seções obrigatórias estão presentes;
- se o conteúdo não está vazio;
- se o conteúdo não é apenas placeholder.

### `validate_handoff.py`
Use para validar se um handoff pode acontecer.

Handoffs suportados:
- `po_to_designer`
- `designer_to_dev`
- `dev_to_qa`
- `qa_to_code_review`

O script verifica:
- arquivos-base de infraestrutura do framework;
- artifacts reais da feature quando o handoff depende deles.

## Fluxo 1: PO → Designer

### Artifact obrigatório
- `product-owner/stories/<feature>.md`

### Sequência
1. O Product Owner cria a story.
2. Roda `validate_artifacts.py` no arquivo como `user_story`.
3. Roda `validate_handoff.py po_to_designer <feature>`.
4. Se passar, o Designer pode começar.

### Exemplo
```powershell
python .\scripts\validate_artifacts.py .\product-owner\stories\auth_2fa.md user_story
python .\scripts\validate_handoff.py po_to_designer auth_2fa
```

## Fluxo 2: Designer → Dev

### Artifacts obrigatórios
- `designer/specs/<feature>_spec.md`
- `designer/flows/<feature>_flow.md`

### Sequência
1. O Designer cria spec e flow.
2. Roda `validate_artifacts.py` no spec como `component_spec`.
3. Roda `validate_artifacts.py` no flow como `user_flow`.
4. Roda `validate_handoff.py designer_to_dev <feature>`.
5. Se passar, o time de desenvolvimento pode começar.

### Exemplo
```powershell
python .\scripts\validate_artifacts.py .\designer\specs\auth_2fa_spec.md component_spec
python .\scripts\validate_artifacts.py .\designer\flows\auth_2fa_flow.md user_flow
python .\scripts\validate_handoff.py designer_to_dev auth_2fa
```

## Fluxo 3: Dev → QA

### Artifact obrigatório
- nenhum por padrão

### Artifact opcional
- `qa-engineer/test-plans/<feature>.md` quando a feature tiver risco relevante, integração sensível ou regressão cara.

### Sequência
1. Dev entrega branch, ambiente ou commit utilizável.
2. Dev informa notas objetivas e confirma smoke test básico.
3. QA roda `validate_handoff.py dev_to_qa <feature>`.
4. Se a feature exigir plano formal, QA pode criar e validar um `test_plan`.

### Exemplo
```powershell
python .\scripts\validate_handoff.py dev_to_qa auth_2fa
python .\scripts\validate_artifacts.py .\qa-engineer\test-plans\auth_2fa.md test_plan
```

## Fluxo 4: QA → Code Review

### Artifact opcional
- `code-reviewer/reviews/<feature>.md` quando a mudança tiver risco arquitetural, de segurança ou de regressão que justifique rastreabilidade formal.

### Sequência
1. QA conclui a validação ou registra claramente o que ficou pendente.
2. Code Reviewer roda `validate_handoff.py qa_to_code_review <feature>`.
3. O reviewer executa a revisão técnica orientada a risco.
4. Se precisar de registro formal, valida um `review_report`.

### Exemplo
```powershell
python .\scripts\validate_handoff.py qa_to_code_review auth_2fa
python .\scripts\validate_artifacts.py .\code-reviewer\reviews\auth_2fa.md review_report
```

## Quando usar `bug_report`
Use `bug_report` somente quando houver defeito real a registrar para retorno ao time.

Exemplo:
```powershell
python .\scripts\validate_artifacts.py .\qa-engineer\bugs\auth_2fa_login_error.md bug_report
```

## Regras Práticas
1. Template não é artifact final.
2. Nem todo papel precisa produzir artifact.
3. Artifact existe apenas se destravar o próximo papel.
4. `validate_artifacts.py` valida estrutura mínima, não qualidade semântica profunda.
5. `validate_handoff.py` valida prontidão operacional mínima para mudança de etapa.
6. O registro de code review é opcional; use quando houver valor real de rastreabilidade.

## Leitura Recomendada
- `../README.md`
- `../shared/handoffs/product-owner-to-designer.md`
- `../shared/handoffs/designer-to-dev.md`
- `../shared/handoffs/dev-to-qa.md`
- `../shared/handoffs/qa-to-code-review.md`
- `../scripts/README.md`
