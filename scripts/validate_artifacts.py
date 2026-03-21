import os
import re
import sys

# Configuração de seções obrigatórias por tipo de artefato
REQUIRED_SECTIONS = {
    'user_story': [
        'Título',
        'Como',
        'Eu quero',
        'Para que',
        'Critérios de Aceite',
        'Notas Técnicas',
        'Notas de Teste (QA)',
        'Impacto/Prioridade'
    ],
    'component_spec': [
        'Componente',
        'Anatomia & Estrutura',
        'Estados & Variantes',
        'Acessibilidade (a11y)',
        'Notas de Implementação'
    ],
    'test_plan': [
        'Projeto/Feature',
        'Objetivo dos Testes',
        'Escopo de Teste',
        'Ferramentas & Ambiente',
        'Cenários de Teste (TC)',
        'Critérios de Aceite para Release'
    ],
    'fastapi_router': [
        'Template: FastAPI Router',
        'Esqueleto do Código',
        'Checklist de Qualidade',
        'APIRouter'
    ],
    'domain_service': [
        'Template: Domain Service',
        'Esqueleto do Código',
        'Checklist de Qualidade',
        'class '
    ],
    'vue_component': [
        'Template: Vue Component',
        'Esqueleto do Código',
        'Checklist de Qualidade',
        '<template>'
    ],
    'streamlit_page': [
        'Template: Streamlit Page',
        'Esqueleto do Código',
        'Checklist de Qualidade',
        'import streamlit'
    ]
}

def has_real_content(content):
    """Verifica se o conteúdo não é apenas placeholders ou vazio."""
    # Remove espaços em branco e quebras de linha
    stripped = content.strip()
    if not stripped:
        return False
    
    # Detecção de placeholders comuns como [...], (Descrição...), <Valor>
    placeholder_patterns = [
        r'\[.*\]',
        r'\(.*\.\.\.\)',
        r'<.*>',
        r'\{.*\}'
    ]
    
    for pattern in placeholder_patterns:
        if re.fullmatch(pattern, stripped):
            return False
            
    return len(stripped) > 5 # Exige pelo menos alguns caracteres de conteúdo real

def validate_markdown(file_path, artifact_type):
    if not os.path.exists(file_path):
        return False, f"Erro: Arquivo {file_path} não encontrado."

    if artifact_type not in REQUIRED_SECTIONS:
        return False, f"Erro: Tipo de artefato '{artifact_type}' não suportado."

    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    missing_sections = []
    empty_sections = []
    sections_to_check = REQUIRED_SECTIONS[artifact_type]
    
    content_full = "".join(lines)

    for section in sections_to_check:
        # Define o padrão de busca para a seção
        if artifact_type == 'user_story' and section == 'Título':
            pattern = r"(#+\s+.*(User Story|Título|História de Usuário)|^\*\*Título:?\*\*)"
        else:
            pattern = rf"(#+\s+.*{re.escape(section)}|^\*\*{re.escape(section)}:?\*\*)"
        
        match = re.search(pattern, content_full, re.MULTILINE | re.IGNORECASE)
        
        if not match:
            missing_sections.append(section)
            continue

        # Validação de conteúdo após a seção
        start_pos = match.end()
        # Encontra o início da próxima seção (qualquer header ou label em negrito no início da linha)
        next_section_match = re.search(r"(^#+|^(\*\*.*\*\*))", content_full[start_pos:], re.MULTILINE)
        
        section_content = ""
        if next_section_match:
            section_content = content_full[start_pos:start_pos + next_section_match.start()]
        else:
            section_content = content_full[start_pos:]

        if not has_real_content(section_content):
            empty_sections.append(section)

    errors = []
    if missing_sections:
        errors.append(f"Seções ausentes: {', '.join(missing_sections)}")
    if empty_sections:
        errors.append(f"Seções sem conteúdo real (apenas placeholders ou vazias): {', '.join(empty_sections)}")

    if errors:
        return False, f"Falha na validação de {artifact_type} em {file_path}:\n - " + "\n - ".join(errors)
    
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
