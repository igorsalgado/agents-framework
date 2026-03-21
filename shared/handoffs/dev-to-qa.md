# Handoff: Dev to QA

Protocolo de passagem do código pronto para a validação de qualidade.

## 📥 Entradas (Dev -> QA)
1. **Branch do Código/URL de Staging.**
2. **Notas Técnicas:** O que mudou e onde o QA deve focar.
3. **Smoke Test:** O desenvolvedor rodou os testes básicos?

## 📤 Saídas (QA -> Dev)
1. **Bug Reports (se houver).**
2. **Test Run Report (Pass/Fail).**
3. **Sinal de Aprovação para Produção.**

## ✅ Checklist de Pronto (Definition of Ready)
- [ ] O código passou em todos os testes unitários?
- [ ] O linting está passando sem erros?
- [ ] A funcionalidade está disponível no ambiente de teste?
