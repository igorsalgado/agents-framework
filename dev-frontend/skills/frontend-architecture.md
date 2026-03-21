# Skill: Frontend Architecture

## Quando usar
Use esta skill para decidir a arquitetura da interface, a escolha entre Streamlit e Vue e a fronteira entre composição visual, estado e integração.

## Padrão Sênior
- Organizar por responsabilidades claras: página, feature, componente e integração.
- Escolher Streamlit quando a velocidade e o fluxo orientado a dados forem prioridade.
- Escolher Vue quando o produto exigir maior controle de navegação, composição e interatividade.
- Definir onde o estado vive e como ele é atualizado.
- Otimizar para legibilidade, mudança incremental e debug.

## Estrutura Recomendada
- Páginas e rotas com responsabilidade clara.
- Componentes de apresentação separados de orquestração quando necessário.
- Estado local, remoto e derivado com papéis distintos.
- Fronteiras explícitas para formulários, tabelas, filtros e painéis.
- Camada de acesso a API pequena e previsível.

## O que evitar
- Arquitetura decidida por moda.
- Shared folder genérica sem critério.
- Fetch espalhado por qualquer componente.
- Escolha de stack sem relação com o contexto.
- Acoplamento excessivo entre layout, dados e side effects.

## Referências
- [Streamlit Documentation](https://r.jina.ai/http://https://docs.streamlit.io/)
- [Vue Guide](https://r.jina.ai/http://https://vuejs.org/guide/introduction)
- [Vite Guide](https://r.jina.ai/http://https://vite.dev/guide/)
