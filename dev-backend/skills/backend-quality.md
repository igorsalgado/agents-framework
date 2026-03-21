# Skill: Backend Quality

## Quando usar
Use esta skill para definir TDD, estratégia de teste, observabilidade mínima e critérios de qualidade para backend Python.

## Padrão Sênior
- Testar primeiro o comportamento crítico ou, no mínimo, travá-lo cedo com pytest.
- Cobrir regra de negócio com testes de baixo custo e alto valor.
- Validar fronteiras importantes com integração e contrato.
- Coletar logs estruturados, métricas e traces úteis para diagnóstico.
- Tratar segurança básica como requisito de construção.

## Estrutura Recomendada
- Testes de domínio para invariantes e casos de uso.
- Testes de integração para banco, filas e dependências externas.
- Contratos de API e compatibilidade.
- Logs com contexto de correlação.
- Métricas de erro, latência e throughput.
- Critérios de pronto ligados à spec, não só à implementação.

## O que evitar
- Cobertura alta com valor baixo.
- TDD burocrático sem ganho real.
- Log verboso e inútil.
- Alerta baseado em ruído.
- Segurança reduzida a checklist sem análise do fluxo real.

## Referências
- [Pytest: Getting Started](https://r.jina.ai/http://https://docs.pytest.org/en/stable/getting-started.html)
- [FastAPI Testing](https://r.jina.ai/http://https://fastapi.tiangolo.com/tutorial/testing/)
- [Django Testing Tools](https://r.jina.ai/http://https://docs.djangoproject.com/en/stable/topics/testing/tools/)
- [OpenTelemetry Docs](https://r.jina.ai/http://https://opentelemetry.io/docs/)
