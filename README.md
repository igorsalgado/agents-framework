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
- `qa-engineer/`
- `data-engineer/`
- `infra/`
- `shared/`
- `scripts/`

Cada papel segue a mesma convenção:
- `agent.md`: missão, postura, entregáveis e barra de qualidade.
- `skills/`: padrões técnicos, anti-padrões e referências oficiais.
- `templates/`: esqueletos pragmáticos para começar rápido sem inventar formato.
- `tools.md`: stack preferencial para reduzir divergência técnica.

## Camadas do Framework
1. Nível de definição: `agent.md`
2. Nível de conhecimento: `skills/`
3. Nível de execução: `templates/`, `tools.md`, artefatos reais por feature e scripts de validação

## Recursos Compartilhados

### `shared/context/`
- `product-vision.md`: direção do produto e limites de escopo.
- `domain-glossary.md`: vocabulário comum do domínio.
- `data-dictionary.md`: entidades, campos e semântica de dados.

### `shared/handoffs/`
- `product-owner-to-designer.md`
- `designer-to-dev.md`
- `dev-to-qa.md`

## Artefatos Reais
- `product-owner/stories/`: histórias reais por feature.
- `designer/specs/`: especificações de interface por feature.
- `designer/flows/`: fluxos de usuário por feature.

## Direcionamento Técnico Atual
- `dev-backend`: Python, FastAPI, Django, API-first, spec-driven, DDD, TDD, clean code e design patterns.
- `dev-frontend`: Streamlit, Vue, Tailwind e bibliotecas que reduzam tempo de entrega sem criar acoplamento desnecessário.
- `qa-engineer`: pytest, Postman, Bandit e validação orientada a risco nesse ecossistema.
- `infra`: Docker, logs, observabilidade e operação enxuta.

## Como usar
1. Ler o `agent.md` do papel principal.
2. Ler de 1 a 3 arquivos em `skills/` diretamente relacionados à tarefa.
3. Consultar `shared/context/` e o handoff aplicável antes de executar.
4. Produzir ou atualizar o artefato real da feature.
5. Rodar os validadores em `scripts/` antes de avançar de etapa.

## Regras de Qualidade
- Assumir `C:\Users\Igor\Desktop\Dev` como base principal de trabalho.
- Priorizar contexto local e documentação oficial antes de improvisar.
- Tratar `skills/` como referência operacional, não como checklist cego.
- Produzir saídas que possam ser consumidas por outro especialista sem reinterpretação.
- Sempre explicitar riscos, lacunas e dependências relevantes.

## Convenções de Conteúdo
- Todos os arquivos `.md` devem ficar em UTF-8.
- Referências externas devem preferir documentação oficial.
- Quando houver URLs externas, usar o formato `r.jina.ai`.
- Skills devem privilegiar decisões práticas, padrões, anti-padrões e critérios de aceite.

## Evolução
- Adicione novas `skills` quando uma especialidade começar a repetir decisões.
- Adicione novos templates apenas quando reduzirem esforço real e forem reutilizáveis.
- Evite pastas paralelas com a mesma responsabilidade.
