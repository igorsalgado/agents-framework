# Skill: Streamlit

## Quando usar
Use esta skill para ferramentas internas, protótipos úteis, dashboards e interfaces orientadas a dados em que velocidade de entrega e clareza operacional são mais importantes que composição avançada de frontend.

## Padrão Sênior
- Escolher Streamlit quando o valor estiver em colocar fluxo útil no ar rapidamente com baixo custo de interface.
- Estruturar a página para leitura clara, ação direta e baixa fricção.
- Usar `session_state` com parcimônia e de forma explícita.
- Tratar filtros, dados vazios, erro de consulta e feedback de ação como parte da experiência.
- Evitar transformar Streamlit em pseudo-SPA cheia de workarounds.

## Checklist Base
- Fluxo principal claro e direto.
- Componentes de entrada e saída organizados por tarefa.
- Estado mínimo necessário e previsível.
- Tratamento de erro, ausência de dados e carregamento.
- Integração com backend ou dados simples de diagnosticar.

## O que evitar
- Forçar interações ricas que a stack não sustenta bem.
- Esconder regra importante em callbacks difíceis de seguir.
- Acumular estado implícito entre telas ou interações.
- Usar Streamlit quando o problema exige navegação e composição mais sofisticadas.
- Construir interface visualmente densa sem hierarquia clara.

## Referências
- [Streamlit Documentation](https://r.jina.ai/https://docs.streamlit.io/)
- [Streamlit API Reference](https://r.jina.ai/https://docs.streamlit.io/develop/api-reference)
- [Multipage Apps](https://r.jina.ai/https://docs.streamlit.io/develop/concepts/multipage-apps/overview)

