# Guia: Criando um Novo Agente

Este guia ensina como criar um novo agente especializado no framework `agents/`.

## Pré-requisitos
- Entender a estrutura do framework em `../README.md`
- Ter clareza sobre o papel do novo agente
- Confirmar que a função não pode ser absorvida por um agente existente

## Quando Criar um Novo Agente
Crie um novo agente quando:
1. existir uma especialidade real ainda não coberta;
2. o papel tiver entregas, métricas ou critérios próprios;
3. houver conhecimento reutilizável suficiente para `skills/`;
4. houver handoff claro com outros papéis.

Não crie se:
- for apenas uma subtarefa de um agente existente;
- o papel não tiver fronteira de responsabilidade clara;
- o novo agente só duplicar stack ou comportamento já coberto.

## Estrutura Obrigatória
Crie uma pasta em kebab-case na raiz do framework:

```text
<nome-do-papel>/
  agent.md
  tools.md
  skills/
    skill-1.md
    skill-2.md
    skill-3.md
  templates/
    template-1.md
    template-2.md
```

## Passo a Passo

### 1. Criar a pasta do agente
- Use kebab-case.
- Seja explícito.
- Evite nomes genéricos como `helper`, `support` ou `misc`.

### 2. Criar `agent.md`
Esse é o contrato comportamental do agente.

O `agent.md` deve capturar postura, critério de decisão, barra de qualidade e colaboração do papel.
Stack, framework, bibliotecas e preferências operacionais devem ficar principalmente em `skills/` e `tools.md`.

Estrutura mínima:
- missão;
- postura de especialista;
- fluxo de trabalho;
- entregáveis esperados;
- barra de qualidade;
- anti-padrões;
- colaboração com outros agentes;
- skills prioritárias.

### 3. Criar `tools.md`
Documente a stack preferencial do papel.

O objetivo é reduzir divergência técnica, não transformar o arquivo em catálogo infinito.
Use `tools.md` para registrar preferências e defaults do workspace sem contaminar o prompt-base do agente.

### 4. Criar skills
Cada skill deve conter:
- quando usar;
- padrões ou decisões;
- anti-padrões;
- critérios práticos;
- referências oficiais.

Crie no mínimo 3 skills úteis. Qualidade importa mais que quantidade.

### 5. Criar templates
Templates são atalhos de execução, não artefatos finais.

Cada template deve conter:
- instruções de uso;
- esqueleto do documento ou código;
- checklist de qualidade.

Crie no mínimo 2 templates quando eles realmente reduzirem esforço recorrente.

### 6. Registrar no handoff
Atualize `shared/handoffs/` somente se o novo agente entra ou sai de um fluxo real.

O handoff deve deixar claro:
- o que entra;
- o que sai;
- o que precisa estar pronto para o próximo papel.

### 7. Revisar `shared/context/`
Se o novo agente depende de contexto compartilhado, atualize:
- `product-vision.md`
- `domain-glossary.md`
- `data-dictionary.md`

### 8. Adicionar validação, se necessário
Só adicione regras em `scripts/validate_artifacts.py` se o agente produzir artifacts de transição que realmente precisem de gate automático.

Para os fluxos operacionais de validação e handoff, consulte `validation-flows.md`.

## Política de Artifacts
Novo agente não precisa ganhar artifacts próprios por padrão.

Artifacts só devem existir quando destravarem o próximo papel.

### Obrigatórios
- apenas os que fazem parte do fluxo real entre agentes.

### Opcionais
- planos de QA para features de risco relevante;
- planos de Infra para mudanças de ambiente, deploy ou observabilidade.

### Evite
- criar pasta de artifacts por reflexo;
- transformar nota interna em artifact;
- duplicar o que já está claro no código, no handoff ou no contexto compartilhado.

## Checklist de Criação
- [ ] Pasta criada em `agents/<nome>/`
- [ ] `agent.md` com missão, postura, fluxo, entregáveis, anti-padrões e colaboração
- [ ] `tools.md` com stack preferencial
- [ ] Mínimo de 3 skills úteis
- [ ] Mínimo de 2 templates úteis
- [ ] Handoffs atualizados, se aplicável
- [ ] Contexto compartilhado revisado, se aplicável
- [ ] Validações adicionadas, se aplicável
- [ ] `README.md` atualizado
- [ ] Agente testado em uma tarefa real

## Regras de Ouro
1. `agent.md` define o papel e a barra de qualidade; `skills/` e `tools.md` carregam o viés técnico.
2. Skills são referência operacional, não checklist cego.
3. Templates são atalhos, não substituto de entendimento.
4. Artifact só existe se alguém realmente depende dele.
5. Melhor menos arquivos úteis do que mais documentação morta.
6. Todo `.md` deve permanecer em UTF-8.
