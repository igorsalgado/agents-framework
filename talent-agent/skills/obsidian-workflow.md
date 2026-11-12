# Skill: Obsidian Vacancy Workflow

## Quando Usar
Sempre que o usuário fornecer uma descrição de vaga ou link para candidatura.

## Padrões de Estrutura
- **Diretório Raiz:** `Daily/Personal/Vagas/`
- **Pasta da Vaga:** `{empresa-slug}/` (Ex: `google/`, `samplemed/`)
- **Arquivos Internos:**
    - `vaga-{cargo-slug}.md`: Nota baseada no `template-vaga.md`.
    - `CV - [Empresa] - Igor Salgado.md`: Currículo adaptado.
    - `job-description.md` (opcional): Cópia da descrição original para referência.

## Procedimento de Execução
1. **Mapeamento:** Gerar o `Job Analysis Report` (conforme template interno).
2. **Criação de Pasta:** Criar o diretório `{empresa-slug}` dentro de `Daily/Personal/Vagas/`.
3. **Nota da Vaga:** 
    - Copiar `Templates/template-vaga.md`.
    - Preencher frontmatter e detalhes com base na descrição fornecida.
4. **Currículo Customizado:**
    - Ler o Master CV: `Daily/Personal/Vagas/Curriculo/CV - Desenvolvedor - IGOR SALGADO.md`.
    - Adaptar o "Resumo Profissional" e as "Skills Técnicas" para dar match com a vaga.
    - Refatorar bullets de experiência usando STAR Method para focar em requisitos core da vaga.
    - Salvar como `Daily/Personal/Vagas/{empresa-slug}/CV - [Empresa] - Igor Salgado.md`.

## Regras de Qualidade
- O Master CV nunca deve ser alterado.
- Os currículos adaptados devem manter a formatação "No icons/ATS Friendly".
- Atualizar o histórico da nota da vaga com a data de envio.
