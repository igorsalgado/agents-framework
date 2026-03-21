# Skill: Architecture Review

## Quando usar
Use esta skill para revisar separação de camadas, acoplamento, contratos, invariantes de domínio e custo de evolução da mudança.

## Padrão Sênior
- Verificar se regra de negócio ficou no lugar certo.
- Confirmar que contratos entre camadas continuam explícitos e previsíveis.
- Procurar vazamento de detalhe de infraestrutura para domínio ou interface.
- Avaliar se a solução aumenta complexidade mais do que reduz risco.

## Sinais de Atenção
- Lógica de negócio espalhada entre controller, view, serializer ou componente.
- Dependências cruzadas difíceis de testar.
- Duplicação de regras em múltiplos pontos.
- Mudança local que cria acoplamento global.

## O que evitar
- Pedir abstração extra sem benefício claro.
- Confundir preferência arquitetural com defeito real.
- Ignorar impacto de manutenção futura.
- Aceitar solução "funciona agora" que fragiliza o contrato central.

## Referências
- [Martin Fowler: Refactoring Catalog](https://r.jina.ai/http://https://refactoring.com/catalog/)
- [FastAPI: Bigger Applications](https://r.jina.ai/http://https://fastapi.tiangolo.com/tutorial/bigger-applications/)
- [Vue Style Guide](https://r.jina.ai/http://https://vuejs.org/style-guide/)
