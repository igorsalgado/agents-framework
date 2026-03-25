# Skill: Security Scanning

## Quando usar
Use esta skill para fazer uma triagem pragmática de segurança estática e complementar a estratégia de QA em aplicações Python.

## Padrão Sênior
- Usar Bandit como sinal inicial, não como veredito final.
- Revisar achados com contexto de código, fluxo e exposição real.
- Priorizar risco explorável e impacto real.
- Integrar a análise com testes e revisão técnica, não isoladamente.

## Checklist Base
- Rodar Bandit no escopo relevante.
- Classificar achados por severidade e probabilidade.
- Identificar falsos positivos e riscos reais.
- Registrar o que precisa correção e o que foi conscientemente aceito.

## O que evitar
- Aceitar ou rejeitar findings sem análise.
- Tratar scanner estático como substituto de revisão.
- Misturar vulnerabilidade real com problema estilístico.
- Abrir bug sem trecho, contexto ou severidade.

## Referências
- [Bandit Documentation](https://r.jina.ai/https://bandit.readthedocs.io/en/latest/)
- [OWASP Web Security Testing Guide](https://r.jina.ai/https://owasp.org/www-project-web-security-testing-guide/)
- [Pytest: Getting Started](https://r.jina.ai/https://docs.pytest.org/en/stable/getting-started.html)
