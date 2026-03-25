# Skill: Python

## Quando usar
Use esta skill para implementar, refatorar ou revisar backend em Python com foco em clareza, tipagem, previsibilidade e operação.

## Padrão Sênior
- Escrever funções e módulos com responsabilidade clara.
- Usar tipagem para reduzir ambiguidade, não para performar complexidade desnecessária.
- Modelar dados com `dataclass`, Pydantic ou classes explícitas quando isso melhorar contrato e legibilidade.
- Tornar efeitos colaterais e dependências externas explícitos.
- Preferir o Python simples, legível e idiomático ao excesso de abstração.

## Checklist Base
- Assinaturas claras e tipos úteis.
- Exceções com contexto suficiente para diagnóstico.
- Dependências e configuração sem hardcode.
- Estrutura de pacote coerente com o domínio ou com o serviço.
- Testes cobrindo comportamento crítico e tratamento de falha.

## O que evitar
- Helpers genéricos que escondem regra importante.
- Estado global implícito.
- Hierarquia de classes desnecessária.
- `async` por moda em fluxos majoritariamente síncronos.
- Tipagem ornamental que dificulta mais do que ajuda.

## Referências
- [Python Documentation](https://r.jina.ai/https://docs.python.org/3/)
- [Python Typing](https://r.jina.ai/https://docs.python.org/3/library/typing.html)
- [Python Packaging User Guide](https://r.jina.ai/https://packaging.python.org/)
