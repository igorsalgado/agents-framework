# Skill: Django

## Quando usar
Use esta skill para monólitos produtivos, backoffice, admin, ORM integrado e aplicações em que a velocidade de entrega com convenções fortes compensa mais do que uma arquitetura distribuída cedo demais.

## Padrão Sênior
- Organizar apps por responsabilidade de negócio, não por acidente técnico.
- Aproveitar admin, ORM, auth e convenções do framework onde isso reduz custo real.
- Manter views, serializers, forms e models sob controle quando a regra de negócio crescer.
- Tratar migrations, settings e permissões como partes centrais da entrega.
- Introduzir camadas de serviço apenas quando a complexidade justificar.

## Checklist Base
- Apps com fronteiras compreensíveis.
- Models e queries coerentes com invariantes e carga esperada.
- Settings separados por ambiente e sem segredos no código.
- Permissões e autenticação revisadas no fluxo alterado.
- Testes de model, view, integração ou admin conforme o risco.

## O que evitar
- `utils.py` gigante como depósito de regra de negócio.
- Signals como mecanismo central de fluxo crítico sem rastreabilidade.
- Lógica espalhada entre model, form, serializer, admin e view sem contrato claro.
- Migration destrutiva sem plano.
- Quebrar convenções do Django sem benefício concreto.

## Referências
- [Django Documentation](https://r.jina.ai/https://docs.djangoproject.com/en/stable/)
- [Django Models](https://r.jina.ai/https://docs.djangoproject.com/en/stable/topics/db/models/)
- [Django Testing](https://r.jina.ai/https://docs.djangoproject.com/en/stable/topics/testing/)
