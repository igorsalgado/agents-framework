# Template: Streamlit Page

Use este padrão para criar interfaces de dados rápidas no Streamlit.

## Instruções de Uso
- Organize a página em seções com títulos claros (`st.title`, `st.header`).
- Use colunas para layouts horizontais (`st.columns`).
- Utilize `@st.cache_data` para operações pesadas.

## Esqueleto do Código
```python
import streamlit as st

def main():
    st.title("[Título da Página]")
    
    # 📊 Gráficos e Dados
    st.header("Visualização de [Recurso]")
    
    # Exemplo de layout em colunas
    col1, col2 = st.columns(2)
    with col1:
        st.write("Dados principais...")
    with col2:
        st.write("Métricas secundárias...")

if __name__ == "__main__":
    main()
```

## Checklist de Qualidade
- [ ] O layout é responsivo (testado no mobile)?
- [ ] Usa cache para chamadas de API pesadas?
- [ ] Mensagens de erro são amigáveis (`st.error`)?
