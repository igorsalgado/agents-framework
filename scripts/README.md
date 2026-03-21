# Scripts README

Este diretório reúne os validadores operacionais do framework.

## Arquivos
- `validate_artifacts.py`
- `validate_handoff.py`

## `validate_artifacts.py`
Valida artifacts reais de transição.

Tipos suportados:
- `user_story`
- `component_spec`
- `user_flow`
- `test_plan`
- `bug_report`
- `review_report`

### Uso
```powershell
python .\scripts\validate_artifacts.py <caminho-do-arquivo> <tipo-do-artefato>
```

### Exemplos
```powershell
python .\scripts\validate_artifacts.py .\product-owner\stories\auth_2fa.md user_story
python .\scripts\validate_artifacts.py .\designer\specs\auth_2fa_spec.md component_spec
python .\scripts\validate_artifacts.py .\designer\flows\auth_2fa_flow.md user_flow
python .\scripts\validate_artifacts.py .\qa-engineer\test-plans\auth_2fa.md test_plan
python .\scripts\validate_artifacts.py .\qa-engineer\bugs\auth_2fa_login_error.md bug_report
python .\scripts\validate_artifacts.py .\code-reviewer\reviews\auth_2fa.md review_report
```

### O que ele checa
- existência do arquivo;
- seções obrigatórias;
- conteúdo mínimo real;
- rejeição de placeholders puros.

## `validate_handoff.py`
Valida se um handoff pode acontecer.

Handoffs suportados:
- `po_to_designer`
- `designer_to_dev`
- `dev_to_qa`
- `qa_to_code_review`

### Uso
```powershell
python .\scripts\validate_handoff.py <tipo-do-handoff> [nome-da-feature]
```

### Exemplos
```powershell
python .\scripts\validate_handoff.py po_to_designer auth_2fa
python .\scripts\validate_handoff.py designer_to_dev auth_2fa
python .\scripts\validate_handoff.py dev_to_qa auth_2fa
python .\scripts\validate_handoff.py qa_to_code_review auth_2fa
```

### O que ele checa
- infraestrutura mínima do framework para aquele handoff;
- artifacts reais da feature quando o handoff depende deles.

## Fluxo Operacional Resumido
1. PO cria a story e valida `user_story`.
2. `po_to_designer` libera o Designer.
3. Designer cria spec e flow e valida ambos.
4. `designer_to_dev` libera Dev.
5. Dev entrega implementação, notas e smoke test.
6. `dev_to_qa` libera QA.
7. QA cria `test_plan` ou `bug_report` apenas quando fizer sentido.
8. `qa_to_code_review` libera o reviewer para a revisão técnica final quando houver valor nesse gate.

## Importante
- Templates em `templates/` não são artifacts finais.
- Nem todo papel precisa gerar artifact.
- Os scripts são gates operacionais mínimos, não revisão técnica completa.

## Guia Relacionado
- `../guide/validation-flows.md`
