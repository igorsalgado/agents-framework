# Skill: Vue

## Quando usar
Use esta skill para construir interfaces web com composição de componentes, roteamento, estado e interação mais ricos do que uma interface de montagem rápida comporta bem.

## Padrão Sênior
- Escolher Vue quando a interface exigir navegação, composição, reutilização de componentes e controle explícito de estado.
- Manter componentes pequenos, com fronteiras claras entre apresentação, estado e integração.
- Centralizar chamadas de API e efeitos colaterais em pontos previsíveis.
- Tratar formulários, loading, erro, vazio e permissões como parte do comportamento, não como detalhe posterior.
- Preferir a Composition API quando ela melhorar legibilidade e organização de responsabilidades.

## Checklist Base
- Estrutura de páginas, rotas e features coerente.
- Componentes com responsabilidade clara.
- Estado local e compartilhado com fronteiras explícitas.
- Tratamento de erro e estados assíncronos previsível.
- Critérios de teste para fluxos críticos e integrações importantes.

## O que evitar
- Criar SPA complexa quando uma solução mais simples resolve o problema.
- Espalhar `fetch` ou regras de integração por qualquer componente.
- Misturar estado global, estado local e estado derivado sem critério.
- Componentes gigantes com template, regra e acesso a API acoplados.
- Escolher biblioteca por moda em vez de necessidade do produto.

## Referências
- [Vue Guide](https://r.jina.ai/http://https://vuejs.org/guide/introduction)
- [Vue Style Guide](https://r.jina.ai/http://https://vuejs.org/style-guide/)
- [Vue Router](https://r.jina.ai/http://https://router.vuejs.org/)

