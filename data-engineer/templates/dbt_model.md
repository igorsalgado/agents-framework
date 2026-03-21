# Template: dbt Model (SQL)

Use este padrão para criar modelos de transformação de dados escaláveis.

## Instruções de Uso
- Utilize CTEs (Common Table Expressions) para organizar a lógica.
- Siga a convenção de nomenclatura (stg_, fct_, dim_).
- Inclua testes de unicidade e nulidade no esquema.

## Esqueleto do Código
```sql
{{ config(materialized='table') }}

WITH raw_data AS (
    SELECT 
        * 
    FROM {{ source('schema', 'table') }}
),

transformed_data AS (
    SELECT
        id,
        CAST(created_at AS TIMESTAMP) as created_at_ts,
        -- Regra de negócio aqui
        status
    FROM raw_data
)

SELECT * FROM transformed_data
```

## Checklist de Qualidade
- [ ] O modelo possui testes de `unique` e `not_null` no arquivo .yml?
- [ ] A nomenclatura segue o padrão (stg/fct/dim)?
- [ ] O código SQL está formatado e legível?
