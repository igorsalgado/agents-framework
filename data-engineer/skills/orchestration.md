# Skill: Orchestration

## Quando usar
Use esta skill para agendar, encadear, monitorar e recuperar pipelines e jobs de dados com previsibilidade operacional.

## Padrão Sênior
- Modelar dependência, SLA e criticidade antes de agendar.
- Garantir idempotência e reprocessamento seguro.
- Usar retry com critério, não para esconder instabilidade estrutural.
- Expor estado de execução, falha e backlog operacional.

## Estrutura Recomendada
- Dependências de entrada e saída.
- Frequência e janela de processamento.
- Política de retry, timeout e alerta.
- Estratégia de backfill.
- Owner operacional.

## O que evitar
- DAG complexa para compensar falta de modelagem.
- Task com múltiplas responsabilidades.
- Agendamento sem considerar disponibilidade da fonte.
- Retry infinito mascarando falha sistêmica.

## Referências
- [Apache Airflow Docs](https://r.jina.ai/http://https://airflow.apache.org/docs/)
- [Apache Airflow: Core Concepts](https://r.jina.ai/http://https://airflow.apache.org/docs/apache-airflow/stable/core-concepts/overview.html)
- [dbt Docs: Deploy](https://r.jina.ai/http://https://docs.getdbt.com/docs/deploy)