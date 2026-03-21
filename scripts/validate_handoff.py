import os
import sys


HANDOFF_CONTRACTS = {
    'po_to_designer': {
        'infra': [
            'shared/context/product-vision.md',
            'shared/context/domain-glossary.md',
        ],
        'feature_artifacts': [
            'product-owner/stories/{feature_name}.md'
        ]
    },
    'designer_to_dev': {
        'infra': [
            'designer/templates/component_spec.md',
            'designer/templates/user_flow.md'
        ],
        'feature_artifacts': [
            'designer/specs/{feature_name}_spec.md',
            'designer/flows/{feature_name}_flow.md'
        ]
    },
    'dev_to_qa': {
        'infra': [
            'dev-backend/templates/fastapi_router.md',
            'dev-frontend/templates/vue_component.md',
            'dev-frontend/templates/streamlit_page.md'
        ],
        'feature_artifacts': [
            # Adicione aqui artefatos reais por feature quando a estrutura de código estiver definida.
        ]
    }
}


def validate_handoff(base_path, handoff_type, feature_name=None):
    if handoff_type not in HANDOFF_CONTRACTS:
        return False, f"Erro: Contrato de handoff '{handoff_type}' não suportado."

    contract = HANDOFF_CONTRACTS[handoff_type]
    missing_files = []

    for rel_path in contract['infra']:
        full_path = os.path.join(base_path, rel_path)
        if not os.path.exists(full_path):
            missing_files.append(rel_path)

    if feature_name:
        for rel_path_tpl in contract['feature_artifacts']:
            rel_path = rel_path_tpl.format(feature_name=feature_name)
            full_path = os.path.join(base_path, rel_path)
            if not os.path.exists(full_path):
                missing_files.append(rel_path)
    else:
        print(f"Aviso: Nome da feature não fornecido. Validando apenas infraestrutura para '{handoff_type}'.")

    if missing_files:
        return False, f"Falha no Handoff {handoff_type}: Arquivos obrigatórios ausentes: {', '.join(missing_files)}"

    return True, f"Sucesso: Todos os pré-requisitos para o handoff '{handoff_type}' (Feature: {feature_name or 'Global'}) foram encontrados."


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Uso: python validate_handoff.py <tipo_do_handoff> [nome_da_feature]")
        sys.exit(1)

    handoff_type = sys.argv[1]
    feature_name = sys.argv[2] if len(sys.argv) > 2 else None
    base_path = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

    success, message = validate_handoff(base_path, handoff_type, feature_name)
    print(message)
    sys.exit(0 if success else 1)
