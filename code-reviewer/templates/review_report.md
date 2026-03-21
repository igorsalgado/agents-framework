# Template: Review Report

Use este padrão para consolidar uma revisão completa quando o time precisar de rastreabilidade ou decisão explícita de merge.

## Instruções de Uso
- Registre somente achados reais e tecnicamente justificáveis.
- Ordene os achados por severidade.
- Referencie arquivo, linha, cenário ou evidência sempre que possível.
- Se não houver problemas relevantes, diga isso explicitamente.

## Relatório de Revisão
**Mudança Revisada:** [PR, branch, commit ou feature]

### Resumo Executivo
[Síntese curta do que mudou, do risco principal e da leitura final da revisão]

### Achados
1. [Severidade] [Arquivo ou fluxo] - [Resumo objetivo do problema]
2. Impacto: [o que pode quebrar, vazar ou degradar]
3. Evidência: [cenário, teste ausente, trecho ou comportamento]
4. Solicitação: [mudança esperada]

### Riscos Residuais
- [Risco aceito, dependência externa ou ponto ainda não coberto]

### Decisão
- [Aprovar / Aprovar com ressalvas / Solicitar mudanças]

## Checklist de Qualidade
- [ ] Cada achado explica por que importa?
- [ ] A decisão final é coerente com a severidade dos achados?
- [ ] Os riscos residuais ficaram explícitos?
