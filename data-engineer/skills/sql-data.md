# Skill: SQL for Data Engineering

## Quando usar
Use esta skill para escrever SQL analítico legível, performático o suficiente e semanticamente claro para transformação e modelagem.

## Padrão Sênior
- Escrever SQL para leitura humana antes de micro-otimizar.
- Tornar grain, chave e intenção do bloco explícitos.
- Usar CTEs para separar etapas lógicas, não para mascarar complexidade.
- Validar semântica de joins, nulls, duplicidade e janela.

## Boas Práticas
- Nomear colunas e CTEs pelo significado.
- Evitar `select *` em camadas estáveis.
- Declarar filtros de incrementalidade e partição conscientemente.
- Padronizar estilo e lint para reduzir ambiguidade.

## O que evitar
- SQL “esperto” que ninguém revisa.
- Join sem explicitar cardinalidade.
- Repetição de regra de negócio em múltiplos modelos.
- Query que mistura staging, business logic e saída final sem separação.

## Referências
- [SQLFluff Docs](https://r.jina.ai/http://https://docs.sqlfluff.com/)
- [PostgreSQL Documentation](https://r.jina.ai/http://https://www.postgresql.org/docs/current/index.html)
- [DuckDB Documentation](https://r.jina.ai/http://https://duckdb.org/docs/stable/)