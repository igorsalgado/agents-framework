# Skill: Bandit

## Quando usar
Use esta skill para triagem estática inicial de segurança em código Python, especialmente quando houver mudanças em autenticação, serialização, subprocesso, arquivos, criptografia ou manipulação de entrada sensível.

## Padrão Sênior
- Usar Bandit como sinal inicial, não como veredito final.
- Revisar cada finding com contexto de exposição, explorabilidade e impacto real.
- Cruzar achados com fluxo de negócio, código afetado e controles existentes.
- Priorizar correção do risco explorável e registrar falsos positivos com critério.
- Integrar o uso de Bandit com teste, revisão técnica e análise de runtime.

## Checklist Base
- Escopo de análise definido.
- Findings classificados por severidade e probabilidade.
- Falsos positivos identificados com justificativa.
- Riscos reais convertidos em correção, bug ou decisão explícita.
- Evidência suficiente para auditoria técnica da triagem.

## O que evitar
- Aceitar ou rejeitar findings sem análise.
- Tratar scanner estático como substituto de revisão de segurança.
- Misturar problema estilístico com vulnerabilidade real.
- Abrir bug sem contexto, trecho, impacto e condição de exploração.
- Rodar a ferramenta e ignorar sistematicamente o resultado sem triagem.

## Referências
- [Bandit Documentation](https://r.jina.ai/https://bandit.readthedocs.io/en/latest/)
- [Bandit Configuration](https://r.jina.ai/https://bandit.readthedocs.io/en/latest/config.html)
- [OWASP Web Security Testing Guide](https://r.jina.ai/https://owasp.org/www-project-web-security-testing-guide/)

