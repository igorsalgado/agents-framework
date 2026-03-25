# Skill: MySQL 8

## Quando usar
Use esta skill para modelagem, queries, índices, transações, migrations e operações de banco de dados em MySQL 8 — incluindo features específicas da versão 8 como window functions, CTEs, JSON e roles.

## Padrão Sênior
- Modelar tabelas em função dos padrões reais de acesso e dos invariantes do domínio.
- Definir tipos de dados mínimos necessários — evitar `TEXT` quando `VARCHAR` resolve, evitar `BIGINT` quando `INT` basta.
- Criar índices com base em queries medidas, não por antecipação especulativa.
- Tratar `NULL` como decisão explícita — documentar quando é intencional.
- Usar `EXPLAIN` e `EXPLAIN ANALYZE` antes de considerar uma query como pronta para produção.
- Migrations devem ter rollback (`DOWN`) seguro e testado.

## Features Relevantes do MySQL 8
- **CTEs (Common Table Expressions)**: `WITH cte AS (...)` para legibilidade em queries complexas.
- **Window Functions**: `ROW_NUMBER()`, `RANK()`, `LAG()`, `LEAD()` para análises sem subquery pesada.
- **JSON**: coluna `JSON` nativa com funções `JSON_EXTRACT()`, `->`, `->>` para dados semiestruturados.
- **Roles**: gerenciamento de permissões por papel em vez de por usuário direto.
- **Invisible Indexes**: testar impacto de remoção de índice sem dropar.
- **`CHECK` Constraints**: validação de integridade no nível do banco.

## Checklist Base
- Tabelas com chave primária clara (`id` ou composta quando faz sentido).
- `NOT NULL` explícito nas colunas obrigatórias.
- `created_at` e `updated_at` com `DEFAULT CURRENT_TIMESTAMP` e `ON UPDATE`.
- Índices em colunas usadas em `WHERE`, `JOIN` e `ORDER BY` frequentes.
- Foreign keys com `ON DELETE` e `ON UPDATE` definidos conscientemente.
- Queries com binding de parâmetros — nunca interpolação de string.
- `EXPLAIN` validado para queries em tabelas grandes.
- Migration com `UP` e `DOWN` completos.

## Tipos de Dados — Decisões Comuns
- IDs: `INT UNSIGNED AUTO_INCREMENT` ou `CHAR(36)` para UUID.
- Monetário: `DECIMAL(15, 2)` — nunca `FLOAT` ou `DOUBLE`.
- Status/enum: `ENUM(...)` ou `TINYINT` com tabela de referência.
- Datas: `DATETIME` para timestamp local, `TIMESTAMP` para UTC com conversão automática.
- Texto longo: `TEXT` apenas quando > 65535 chars; `VARCHAR(255)` para maioria dos casos.

## O que evitar
- `SELECT *` em queries de produção.
- Lógica de negócio crítica em triggers sem documentação explícita.
- Joins em colunas sem índice em tabelas grandes.
- `ENUM` com valores que mudam frequentemente — prefira tabela de referência.
- Migração destrutiva (`DROP COLUMN`, `DROP TABLE`) sem plano de rollback.
- Transações longas que mantêm locks desnecessários.

## Referências
- [MySQL 8.0 Reference Manual](https://r.jina.ai/https://dev.mysql.com/doc/refman/8.0/en/)
- [MySQL 8.0: What's New](https://r.jina.ai/https://dev.mysql.com/doc/refman/8.0/en/mysql-nutshell.html)
- [MySQL EXPLAIN Output Format](https://r.jina.ai/https://dev.mysql.com/doc/refman/8.0/en/explain-output.html)
