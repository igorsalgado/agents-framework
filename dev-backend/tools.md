# Tools: Dev Backend

Stack preferencial para backend pragmático em Python.

## Linguagem e Base
- Python 3.12+
- `uv` ou `pip-tools` para ambiente e dependências
- Ruff
- mypy ou pyright

## Frameworks e API
- FastAPI para APIs modernas, spec-driven e API-first
- Django para monólitos produtivos, admin e casos com backoffice forte
- Pydantic
- OpenAPI / Swagger

## Persistência e Dados
- PostgreSQL
- Redis
- SQLAlchemy ou Django ORM
- Alembic quando o stack pedir migrações fora do Django

## Testes e Qualidade
- pytest
- httpx
- factory_boy
- Faker

## Arquitetura
- DDD pragmático
- TDD quando o risco justificar
- Clean code
- Design patterns apenas quando reduzirem acoplamento ou duplicação real

## Runtime
- Docker
- Logs estruturados
