# Template: FastAPI Router

Use este esqueleto para criar novos endpoints de API.

## Instruções de Uso
- Sempre use `APIRouter` para modularização.
- Inclua `tags` para documentação automática no Swagger.
- Defina `responses` para códigos de erro comuns (404, 400).

## Esqueleto do Código
```python
from fastapi import APIRouter, HTTPException, Depends
from typing import List

router = APIRouter(
    prefix="/[recurso]",
    tags=["[nome-do-recurso]"],
    responses={404: {"description": "Not found"}},
)

@router.get("/", response_model=List[dict])
async def list_items():
    # Regra: Sempre delegar lógica complexa para o Domain Service
    return [{"id": 1, "name": "Exemplo"}]
```

## Checklist de Qualidade
- [ ] Possui docstring explicando o propósito do endpoint?
- [ ] Trata exceções com `HTTPException`?
- [ ] Valida inputs com Pydantic (se aplicável)?
