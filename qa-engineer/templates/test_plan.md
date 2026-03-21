# Template: Test Plan

Use este padrão para definir a estratégia de validação de uma funcionalidade.

## Instruções de Uso
- Defina o escopo de teste com base nos critérios de aceite.
- Identifique os cenários críticos (Smoke Test).
- Especifique as ferramentas necessárias para os testes automatizados.

## Plano de Teste
**Projeto/Feature:** [Nome da Funcionalidade]

### Objetivo dos Testes
[Breve descrição da meta da validação]

### Escopo de Teste
- [ ] [Fluxo Principal A]
- [ ] [Fluxo de Exceção B]
- [ ] [Regressão de Módulo X]

### Ferramentas & Ambiente
- **Runner:** [pytest/Playwright]
- **Browser:** [Chrome/Firefox]
- **Ambiente:** [Staging/Local]

### Cenários de Teste (TC)
- **TC-01:** [Título] -> [Ação] -> [Resultado Esperado]
- **TC-02:** [Título] -> [Ação] -> [Resultado Esperado]

### Critérios de Aceite para Release
- [ ] 100% dos fluxos principais passando.
- [ ] Zero bugs críticos abertos.

## Checklist de Qualidade
- [ ] O plano de teste cobre todos os critérios de aceite?
- [ ] O desenvolvedor consegue rodar o Smoke Test?
- [ ] Os dados de teste necessários estão mapeados?
