# Skill: dbt

## Quando usar
Use esta skill para modelagem analítica em camadas, testes de transformação, documentação e organização de projeto em analytics engineering.

## Padrão Sênior
- Separar staging, intermediate e marts com intenção clara.
- Nomear modelos por função analítica, não por query circunstancial.
- Tratar testes, documentação e exposição como parte do modelo.
- Evitar dependências implícitas e lógica repetida.

## Boas Práticas
- Definir grain explicitamente.
- Usar sources, refs e tests para preservar rastreabilidade.
- Promover reutilização com macros quando houver padrão real.
- Manter modelos pequenos o suficiente para revisão e debug.

## O que evitar
- Modelo “final” acumulando todas as regras.
- Ref sem intenção clara.
- Testes mínimos só para cumprir processo.
- Documentação desatualizada em relação ao SQL.

## Referências
- [dbt Docs: Introduction](https://r.jina.ai/http://https://docs.getdbt.com/docs/introduction)
- [dbt Docs: Build Models](https://r.jina.ai/http://https://docs.getdbt.com/docs/build/models)
- [dbt Docs: Data Tests](https://r.jina.ai/http://https://docs.getdbt.com/docs/build/data-tests)