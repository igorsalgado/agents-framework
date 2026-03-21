# Tools: Dev Backend

Stack preferencial para engenharia backend pragmática, com escolha guiada por contexto.

## Base de Trabalho
- Git
- Docker
- logs estruturados e observabilidade disponível no ambiente

## Stack Mais Comum Neste Workspace
- Python 3.12+
- `uv` ou `pip-tools` para ambiente e dependências
- Ruff
- mypy ou pyright
- pytest

## Frameworks por Contexto
- FastAPI para APIs HTTP modernas, OpenAPI e serviços orientados a contrato
- Django para monólitos produtivos, admin, backoffice e ORM integrado
- Pydantic quando schema e validação explícita fizerem sentido

## Persistência e Integrações
- PostgreSQL
- Redis
- SQLAlchemy ou Django ORM
- Alembic quando o stack pedir migrações fora do Django
- `httpx` para integrações HTTP e testes

## Critério de Escolha
- Prefira a menor combinação de ferramentas que resolva o problema com segurança.
- Não imponha FastAPI ou Django fora do contexto em que eles realmente ajudam.
- Use patterns, camadas e abstrações apenas quando reduzirem acoplamento, risco ou duplicação real.
