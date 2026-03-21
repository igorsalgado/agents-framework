# Skill: Security Review

## Quando usar
Use esta skill para revisar autenticação, autorização, isolamento de dados, entrada de usuário, consultas sensíveis e exposição indevida de informação.

## Padrão Sênior
- Priorizar riscos exploráveis e impacto real sobre dados ou operação.
- Verificar autenticação, autorização e escopo de acesso em cada fluxo alterado.
- Confirmar sanitização, validação e uso seguro de queries, arquivos e segredos.
- Tratar scanner como apoio, nunca como veredito isolado.

## Checklist Base
- Controle de acesso correto.
- Escopo de tenant, usuário ou recurso preservado.
- Dados sensíveis fora de logs e responses indevidos.
- Queries e chamadas externas construídas com segurança.
- Defaults seguros para configuração e falha.

## O que evitar
- Validar apenas presença de autenticação e ignorar autorização.
- Assumir que ORM ou framework elimina todo risco.
- Aprovar código que vaza contexto sensível em logs, erros ou payloads.
- Abrir finding genérico sem cenário de exploração ou impacto.

## Referências
- [OWASP ASVS](https://r.jina.ai/http://https://owasp.org/www-project-application-security-verification-standard/)
- [OWASP Top 10](https://r.jina.ai/http://https://owasp.org/www-project-top-ten/)
- [Bandit Documentation](https://r.jina.ai/http://https://bandit.readthedocs.io/en/latest/)
