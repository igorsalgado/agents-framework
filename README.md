# Agents Workspace

Esta pasta organiza prompts, padrões operacionais e artefatos de trabalho por especialidade para agentes de IA em `C:\Users\Igor\Desktop\Dev`.

## Regra Global
- Todo agente deve atuar de forma pragmática: priorizar clareza, custo-benefício, contexto real, entrega útil e o menor nível de complexidade que resolva o problema com segurança.

## Objetivo
- Centralizar instruções por papel com nível sênior/especialista.
- Separar comportamento do agente (`agent.md`) de conhecimento reutilizável (`skills/*.md`).
- Manter contratos de handoff, contexto compartilhado e validações automatizadas em um único workspace.

## Estrutura
- `designer/`
- `product-owner/`
- `dev-backend/`
- `dev-frontend/`
- `code-reviewer/`
- `qa-engineer/`
- `data-engineer/`
- `infra/`
- `guide/`
- `shared/`
- `scripts/`

Cada papel segue a mesma convenção:
- `agent.md`: missão, postura, entregáveis e barra de qualidade.
- `skills/`: padrões técnicos, anti-padrões e referências oficiais.
- `templates/`: esqueletos pragmáticos para começar rápido sem inventar formato.
- `tools.md`: stack preferencial para reduzir divergência técnica.

## Regra de Desenho dos Agentes
- `agent.md` deve ser contexto-first e orientado ao papel.
- Viés de stack, framework, biblioteca e ferramenta deve viver principalmente em `skills/` e `tools.md`.
- O agente escolhe tecnologia a partir do problema real, não do prompt-base.

## Camadas do Framework
1. Nível de definição: `agent.md`
2. Nível de conhecimento: `skills/`
3. Nível de execução: `templates/`, `tools.md`, artifacts de transição e scripts de validação

## Recursos Compartilhados

### `shared/context/`
- `product-vision.md`: direção do produto e limites de escopo.
- `domain-glossary.md`: vocabulário comum do domínio.
- `data-dictionary.md`: entidades, campos e semântica de dados.

### `shared/handoffs/`
- `product-owner-to-designer.md`
- `designer-to-dev.md`
- `dev-to-qa.md`
- `qa-to-code-review.md`

## Política de Artifacts
Artifacts existem apenas quando destravam o próximo papel.

### Artifacts obrigatórios de transição
- `product-owner/stories/`: stories reais por feature.
- `designer/specs/`: especificações de interface por feature.
- `designer/flows/`: fluxos de usuário por feature.

### Artifacts opcionais
- `qa-engineer/test-plans/`: só para features com risco relevante, integração sensível ou regressão cara.
- `code-reviewer/reviews/`: só quando a mudança exigir rastreabilidade formal de revisão técnica.
- `infra/plans/`: só quando houver ambiente, deploy, observabilidade, runtime ou operação nova.

### O que não virar artifact por padrão
- notas genéricas de implementação backend;
- notas genéricas de implementação frontend;
- documentação intermediária que não destrava ninguém;
- duplicação do que já está claro no código, no commit ou no handoff.

## Direcionamento Técnico Atual
- `dev-backend`: engenharia backend orientada a contrato, domínio, dados e operação; a stack específica fica nas skills e Python é hoje a base mais comum do workspace.
- `dev-frontend`: engenharia de interface orientada a fluxo, estado, acessibilidade, integração e manutenção; a stack específica fica nas skills e em `tools.md`.
- `code-reviewer`: revisão orientada a risco com foco em regressão, segurança, arquitetura, testes e merge readiness.
- `qa-engineer`: engenharia de qualidade orientada a risco, evidência e release readiness; ferramentas específicas ficam nas skills e em `tools.md`.
- `data-engineer`: engenharia de dados orientada a modelagem analítica, confiabilidade, qualidade e governança; a stack específica fica nas skills e em `tools.md`.
- `infra`: operação orientada a reprodutibilidade, diagnóstico, observabilidade e baixo atrito; escolhas de plataforma ficam nas skills e em `tools.md`.

## Como usar
1. Ler o `agent.md` do papel principal.
2. Ler de 1 a 3 arquivos em `skills/` diretamente relacionados à tarefa.
3. Consultar `shared/context/` e o handoff aplicável antes de executar.
4. Produzir artifact real apenas se ele destravar o próximo papel.
5. Rodar os validadores em `scripts/` antes de avançar de etapa.

## Regras de Qualidade
- Assumir `C:\Users\Igor\Desktop\Dev` como base principal de trabalho.
- Priorizar contexto local e documentação oficial antes de improvisar.
- Tratar `skills/` como referência operacional, não como checklist cego.
- Produzir saídas que possam ser consumidas por outro especialista sem reinterpretação.
- Sempre explicitar riscos, lacunas e dependências relevantes.
- Não criar artifact só para "deixar registrado"; artifact sem consumidor é ruído.

## Convenções de Conteúdo
- Todos os arquivos `.md` devem ficar em UTF-8.
- Referências externas devem preferir documentação oficial.
- Quando houver URLs externas, usar o formato `r.jina.ai`.
- Skills devem privilegiar decisões práticas, padrões, anti-padrões e critérios de aceite.

## Evolução
- Adicione novas `skills` quando uma especialidade começar a repetir decisões.
- Adicione novos templates apenas quando reduzirem esforço real e forem reutilizáveis.
- Evite pastas paralelas com a mesma responsabilidade.
- Para criar um novo agente, consulte `guide/new-agent.md`.
- Para entender os gates de validação e handoff, consulte `guide/validation-flows.md`.
