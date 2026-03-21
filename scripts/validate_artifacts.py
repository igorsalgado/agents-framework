import os
import re
import sys


# Valide apenas artifacts reais de transição entre agentes.
REQUIRED_SECTIONS = {
    "user_story": [
        "Título",
        "Como",
        "Eu quero",
        "Para que",
        "Critérios de Aceite",
        "Notas Técnicas",
        "Notas de Teste (QA)",
        "Impacto/Prioridade",
    ],
    "component_spec": [
        "Componente",
        "Anatomia & Estrutura",
        "Estados & Variantes",
        "Acessibilidade (a11y)",
        "Notas de Implementação",
    ],
    "user_flow": [
        "Fluxo",
        "Objetivo",
        "Ator Principal",
        "Passos do Fluxo",
        "Pontos de Atrito Potenciais",
    ],
    "test_plan": [
        "Projeto/Feature",
        "Objetivo dos Testes",
        "Escopo de Teste",
        "Ferramentas & Ambiente",
        "Cenários de Teste (TC)",
        "Critérios de Aceite para Release",
    ],
    "bug_report": [
        "Bug",
        "Descrição",
        "Passos para Reproduzir",
        "Comportamento Esperado",
        "Comportamento Atual",
        "Informações Técnicas",
    ],
    "review_report": [
        "Mudança Revisada",
        "Resumo Executivo",
        "Achados",
        "Riscos Residuais",
        "Decisão",
    ],
}


def has_real_content(content):
    """Verifica se o conteúdo não é apenas placeholders ou vazio."""
    stripped = content.strip()
    if not stripped:
        return False

    placeholder_patterns = [
        r"\[.*\]",
        r"\(.*\.\.\.\)",
        r"<.*>",
        r"\{.*\}",
    ]

    for pattern in placeholder_patterns:
        if re.fullmatch(pattern, stripped):
            return False

    return len(stripped) > 5


def build_section_pattern(artifact_type, section):
    if artifact_type == "user_story" and section == "Título":
        return r"(#+\s+.*(User Story|Título|História de Usuário)|^\*\*Título:?\*\*)"

    return rf"(#+\s+.*{re.escape(section)}|^\*\*{re.escape(section)}:?\*\*)"


def validate_markdown(file_path, artifact_type):
    if not os.path.exists(file_path):
        return False, f"Erro: Arquivo {file_path} não encontrado."

    if artifact_type not in REQUIRED_SECTIONS:
        supported = ", ".join(sorted(REQUIRED_SECTIONS.keys()))
        return (
            False,
            f"Erro: Tipo de artefato '{artifact_type}' não suportado. Tipos válidos: {supported}",
        )

    with open(file_path, "r", encoding="utf-8") as f:
        content_full = f.read()

    missing_sections = []
    empty_sections = []

    for section in REQUIRED_SECTIONS[artifact_type]:
        pattern = build_section_pattern(artifact_type, section)
        match = re.search(pattern, content_full, re.MULTILINE | re.IGNORECASE)

        if not match:
            missing_sections.append(section)
            continue

        start_pos = match.end()
        next_section_match = re.search(
            r"(^#+|^(\*\*.*\*\*))", content_full[start_pos:], re.MULTILINE
        )

        if next_section_match:
            section_content = content_full[start_pos : start_pos + next_section_match.start()]
        else:
            section_content = content_full[start_pos:]

        if not has_real_content(section_content):
            empty_sections.append(section)

    errors = []
    if missing_sections:
        errors.append(f"Seções ausentes: {', '.join(missing_sections)}")
    if empty_sections:
        errors.append(
            f"Seções sem conteúdo real (apenas placeholders ou vazias): {', '.join(empty_sections)}"
        )

    if errors:
        return (
            False,
            f"Falha na validação de {artifact_type} em {file_path}:\n - " + "\n - ".join(errors),
        )

    return True, f"Sucesso: {file_path} é um {artifact_type} válido e preenchido."


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Uso: python validate_artifacts.py <caminho_do_arquivo> <tipo_do_artefato>")
        sys.exit(1)

    file_path = sys.argv[1]
    artifact_type = sys.argv[2]

    success, message = validate_markdown(file_path, artifact_type)
    print(message)
    sys.exit(0 if success else 1)
