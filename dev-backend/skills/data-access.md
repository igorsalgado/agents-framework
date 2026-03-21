# Skill: Data Access

## Quando usar
Use esta skill para modelagem relacional, queries, transações, índices, migrações e acesso seguro a dados de produção.

## Padrão Sênior
- Modelar em função de invariantes e padrões reais de acesso.
- Tornar transação, isolamento e concorrência decisões explícitas.
- Criar índices por necessidade medida, não por superstição.
- Tratar migração como mudança de produção, com plano de rollout e rollback.

## Checklist Base
- Modelo com constraints adequadas.
- Estratégia de leitura e escrita coerente com a carga.
- Queries inspecionáveis e sem N+1 evitável.
- Migrações reversíveis ou com mitigação planejada.
- Auditoria e rastreabilidade quando o domínio exigir.

## O que evitar
- Query complexa sem plano de teste e observação.
- Índices redundantes.
- Migração destrutiva sem janela ou fallback.
- Regra de negócio crítica escondida em trigger sem documentação.

## Referências
- [PostgreSQL Documentation](https://r.jina.ai/http://https://www.postgresql.org/docs/current/index.html)
- [PostgreSQL: Transactions](https://r.jina.ai/http://https://www.postgresql.org/docs/current/tutorial-transactions.html)
- [PostgreSQL: Indexes](https://r.jina.ai/http://https://www.postgresql.org/docs/current/indexes.html)