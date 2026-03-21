# Guia: Criando um Novo Agente

Este tutorial ensina como criar um novo agente especializado no framework `agents/`.

---

## 📋 Pré-requisitos

- Entender a estrutura do framework (leia `../README.md` primeiro)
- Ter clareza sobre o papel/especialidade do novo agente
- Conhecer os agentes existentes para evitar sobreposição

---

## 🎯 Quando Criar um Novo Agente

Crie um novo agente quando:

1. **Nova especialidade necessária**: Uma disciplina técnica não coberta pelos agentes atuais
2. **Responsabilidade distinta**: O papel tem entregas, métricas e critérios de qualidade únicos
3. **Conhecimento reutilizável**: Existe um corpo de conhecimento que pode ser documentado em `skills/`
4. **Handoff claro**: O agente se conecta a outros via protocolos de entrada/saída definidos

**Não crie** se:
- A função pode ser absorvida por um agente existente
- É apenas uma sub-tarefa de um agente já existente (use `skills/` em vez disso)

---

## 📁 Estrutura Obrigatória

Crie uma pasta com o nome do papel em **kebab-case**:

```
agents/<nome-do-papel>/
├── agent.md           ← Missão, postura, fluxo, entregáveis
├── tools.md           ← Stack preferencial
├── skills/            ← Conhecimento técnico (mínimo 3)
│   ├── skill-1.md
│   ├── skill-2.md
│   └── skill-3.md
└── templates/         ← Esqueletos de artefatos (mínimo 2)
    ├── template-1.md
    └── template-2.md
```

---

## 📝 Passo a Passo

### 1. Criar a Pasta do Agente

```bash
mkdir agents\<nome-do-papel>
mkdir agents\<nome-do-papel>\skills
mkdir agents\<nome-do-papel>\templates
```

**Convenção de nomenclatura:**
- Use **kebab-case**: `dev-backend`, `data-engineer`, `product-owner`
- Seja explícito: evite nomes genéricos como `helper` ou `support`

---

### 2. Criar `agent.md`

Este é o **contrato comportamental** do agente. Use a estrutura abaixo:

```markdown
# Agent Prompt: <Nome do Papel>

Você é um <papel> sênior, orientado a <foco principal>, com expertise em <áreas-chave>.

## Missão
- <Objetivo principal 1>
- <Objetivo principal 2>
- <Objetivo principal 3>

## Postura de Especialista
- <Princípio de atuação 1>
- <Princípio de atuação 2>
- <Princípio de atuação 3>

## Fluxo de Trabalho
1. <Etapa 1>
2. <Etapa 2>
3. <Etapa 3>
4. <Etapa 4>
5. <Etapa 5>

## Entregáveis Esperados
- <Entregável 1>
- <Entregável 2>
- <Entregável 3>

## Barra de Qualidade
- <Critério de qualidade 1>
- <Critério de qualidade 2>
- <Critério de qualidade 3>

## Anti-padrões
- <O que NÃO fazer 1>
- <O que NÃO fazer 2>
- <O que NÃO fazer 3>

## Colaboração
- Com `product-owner`: <o que alinhar>
- Com `designer`: <o que alinhar>
- Com `dev-backend`: <o que alinhar>
- Com `dev-frontend`: <o que alinhar>
- Com `qa-engineer`: <o que alinhar>
- Com `infra`: <o que alinhar>
- Com `data-engineer`: <o que alinhar>

## Uso de Skills
Antes de agir, consulte as skills mais relevantes em `./skills/`, especialmente:
- `<skill-1.md>`
- `<skill-2.md>`
- `<skill-3.md>`
```

**Dicas:**
- Escreva na **segunda pessoa** ("Você é...")
- Seja **prescritivo** sobre postura e critérios
- Liste **anti-padrões** explícitos
- Defina **colaboração** com outros agentes

---

### 3. Criar `tools.md`

Documente a stack preferencial para reduzir divergência técnica:

```markdown
# Tools: <Nome do Papel>

Stack preferencial para <papel>.

## Linguagens
- <Linguagem 1>
- <Linguagem 2>

## Frameworks & Bibliotecas
- <Framework 1>
- <Framework 2>

## Ferramentas
- <Ferramenta 1>
- <Ferramenta 2>

## Critérios de Escolha
- Priorize <critério 1>
- Evite <critério 2>
```

---

### 4. Criar Skills (Mínimo 3)

Cada skill é um arquivo em `skills/` com conhecimento técnico reutilizável:

```markdown
# Skill: <Nome da Skill>

## Decisões
- <Decisão técnica 1>
- <Decisão técnica 2>

## Padrões
- <Padrão 1>
- <Padrão 2>

## Anti-padrões
- <O que evitar 1>
- <O que evitar 2>

## Critérios de Aceite
- <Critério 1>
- <Critério 2>

## Referências
- [Documentação Oficial](URL)
```

**Exemplos de skills por papel:**
- `dev-backend`: `api-design.md`, `service-architecture.md`, `data-access.md`, `backend-quality.md`
- `qa-engineer`: `test-strategy.md`, `api-testing.md`, `e2e-ui.md`, `security-scanning.md`
- `designer`: `ui.md`, `ux.md`, `accessibility.md`, `design-systems.md`

---

### 5. Criar Templates (Mínimo 2)

Templates são esqueletos pragmáticos para começar rápido:

```markdown
# Template: <Nome do Template>

## Instruções de Uso
- <Quando usar>
- <Como preencher>

## Estrutura
<Esqueleto do artefato>

## Checklist de Qualidade
- [ ] <Item 1>
- [ ] <Item 2>
- [ ] <Item 3>
```

**Exemplos:**
- `dev-backend`: `fastapi_router.md`, `domain_service.md`
- `product-owner`: `user_story.md`, `roadmap.md`
- `qa-engineer`: `test_plan.md`, `bug_report.md`

---

### 6. Registrar no Handoff

Se o agente recebe ou entrega para outros, atualize os handoffs em `shared/handoffs/`:

| Handoff | Arquivo | O que adicionar |
|---------|---------|-----------------|
| PO → Designer | `product-owner-to-designer.md` | Entradas/saídas do novo agente |
| Designer → Dev | `designer-to-dev.md` | Especificações que o agente consome |
| Dev → QA | `dev-to-qa.md` | Artefatos que o agente produz |

Se necessário, crie um **novo handoff**:

```markdown
# Handoff: <Origem> to <Destino>

Protocolo de passagem de bastão entre <papel A> e <papel B>.

## 📥 Entradas (<A> → <B>)
1. **Artefato 1:** Descrição
2. **Artefato 2:** Descrição

## 📤 Saídas (<B> → <A>)
1. **Artefato 1:** Descrição
2. **Artefato 2:** Descrição

## ✅ Checklist de Pronto (Definition of Ready)
- [ ] Condição 1
- [ ] Condição 2
```

---

### 7. Atualizar `shared/context/`

Se o agente precisa de contexto compartilhado, verifique se existe:

- `product-vision.md`: Visão do produto
- `domain-glossary.md`: Vocabulário do domínio
- `data-dictionary.md`: Dicionário de dados

Crie ou atualize conforme necessário.

---

### 8. Adicionar Validação (Opcional)

Se o agente produz artefatos validáveis, adicione regras em `scripts/validate_artifacts.py`:

```python
REQUIRED_SECTIONS = {
    'novo_artefato': [
        'Seção 1',
        'Seção 2',
        'Seção 3'
    ]
}
```

---

## ✅ Checklist de Criação

Antes de considerar o agente pronto, verifique:

- [ ] Pasta criada em `agents/<nome>/`
- [ ] `agent.md` com missão, postura, fluxo, entregáveis, anti-padrões
- [ ] `tools.md` com stack preferencial
- [ ] Mínimo de 3 skills em `skills/`
- [ ] Mínimo de 2 templates em `templates/`
- [ ] Handoffs atualizados em `shared/handoffs/`
- [ ] Contexto compartilhado revisado em `shared/context/`
- [ ] Validações adicionadas (se aplicável)
- [ ] `README.md` atualizado com novo agente
- [ ] Agente testado em uma tarefa real

---

## 🧪 Testando o Novo Agente

Após criar, valide o agente:

1. **Leia o `agent.md`**: A missão está clara?
2. **Consulte uma skill**: O conhecimento é acionável?
3. **Use um template**: O esqueleto é útil?
4. **Simule um handoff**: A conexão com outros agentes funciona?
5. **Rode validações**: Os scripts reconhecem os artefatos?

---

## 📚 Exemplo Real: `dev-backend`

Estrutura completa de referência:

```
agents/dev-backend/
├── agent.md              ← 7 seções: Missão, Postura, Fluxo, Entregáveis, Barra, Anti-padrões, Colaboração
├── tools.md              ← Python, FastAPI, Django, pytest, Docker
├── skills/
│   ├── api-design.md     ← Decisões sobre REST, versionamento, erros
│   ├── service-architecture.md  ← Camadas, DDD, patterns
│   ├── data-access.md    ← ORM, migrations, transações
│   └── backend-quality.md ← TDD, linting, code review
└── templates/
    ├── fastapi_router.md ← Esqueleto de endpoint com checklist
    └── domain_service.md ← Esqueleto de serviço de domínio
```

---

## 🔄 Evolução do Agente

Após a criação:

1. **Adicione skills** quando decisões começarem a se repetir
2. **Adicione templates** quando reduzirem esforço real
3. **Revise anti-padrões** quando novos problemas surgirem
4. **Atualize colaboração** quando handoffs mudarem

---

## 📌 Regras de Ouro

1. **Skills não são checklist**: São referência operacional, use com julgamento
2. **Templates são atalhos**: Não substituem entendimento do contexto
3. **Agente não é ilha**: Handoffs definem como o trabalho flui
4. **Qualidade > Quantidade**: Melhor 3 skills úteis que 10 genéricas
5. **UTF-8 obrigatório**: Todo `.md` deve preservar caracteres especiais

---

*Este guia segue o padrão do framework `agents/`. Para dúvidas, consulte `../README.md`.*
