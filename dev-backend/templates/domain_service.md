# Template: Domain Service

Use este padrão para encapsular regras de negócio puras, independentes de infraestrutura.

## Instruções de Uso
- Classes devem ter responsabilidade única.
- Métodos devem ser testáveis isoladamente.
- Não injete lógica de API (como `HTTPException`) aqui.

## Esqueleto do Código
```python
class [ResourceName]Service:
    """
    Serviço responsável por [descrição da responsabilidade].
    """
    
    def __init__(self, repository=None):
        self.repository = repository

    def execute_logic(self, data: dict):
        # Regra de negócio: Implementar validações e transformações aqui
        return {"status": "success", "processed_data": data}
```

## Checklist de Qualidade
- [ ] O nome da classe é um substantivo claro?
- [ ] O método principal é curto e legível?
- [ ] As dependências externas são passíveis de mock?
