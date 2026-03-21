# Skill: Data Quality

## Quando usar
Use esta skill para validar schema, completude, unicidade, consistência e confiança analítica ao longo do pipeline.

## Padrão Sênior
- Tratar qualidade como parte do contrato de dados.
- Diferenciar falha de fonte, transformação e consumo.
- Implementar validações proporcionais ao impacto do dado.
- Tornar a falha observável e acionável.

## Estrutura Recomendada
- Regras por coluna, chave e modelo.
- Testes de negócio para métricas críticas.
- Monitoramento de volume, atraso e distribuição.
- Estratégia de quarentena, alerta ou bloqueio.

## O que evitar
- Testes genéricos sem contexto de negócio.
- Qualidade verificada apenas em dashboard final.
- Falha silenciosa em pipeline crítico.
- Aceitar quebra de contrato sem versionamento ou comunicação.

## Referências
- [dbt Docs: Data Tests](https://r.jina.ai/http://https://docs.getdbt.com/docs/build/data-tests)
- [Great Expectations Docs](https://r.jina.ai/http://https://docs.greatexpectations.io/docs/home)
- [Apache Airflow Docs](https://r.jina.ai/http://https://airflow.apache.org/docs/)