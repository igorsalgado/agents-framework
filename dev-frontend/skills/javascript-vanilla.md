# Skill: JavaScript Vanilla

## Quando usar
Use esta skill para escrever JavaScript sem dependência de framework ou biblioteca — manipulação de DOM nativa, Fetch API, módulos ES, eventos e lógica de interação direta no browser.

## Padrão Sênior
- Preferir APIs nativas modernas (`querySelector`, `fetch`, `classList`, `dataset`) a polyfills e libs desnecessárias.
- Usar módulos ES (`import/export`) quando o projeto suportar — evitar globals.
- Separar responsabilidades: funções de DOM, funções de dados e funções de estado devem ser distintas.
- Tratar erros em operações assíncronas com `try/catch` em `async/await` ou `.catch()` em Promises.
- Sanitizar qualquer dado externo antes de inserir no DOM — nunca usar `innerHTML` com input do usuário.

## Boas Práticas
- Usar `const` por padrão, `let` quando necessário reatribuir, nunca `var`.
- Funções pequenas com responsabilidade única e nome descritivo.
- Delegação de eventos para elementos dinâmicos via `addEventListener` no pai.
- `data-*` attributes para passar dados do servidor ao JS de forma explícita.
- `async/await` para fluxos assíncronos — mais legível que `.then()` encadeado.
- Evitar manipulação de DOM em loop — usar `DocumentFragment` ou batch update.

## Checklist Base
- Sem `var` — usar `const` e `let`.
- Operações assíncronas com tratamento de erro explícito.
- Sem `innerHTML` com dados não sanitizados.
- Funções com nome que descreve o que fazem.
- Eventos removidos quando o elemento é destruído (evitar memory leak).
- Sem `console.log` em produção.

## O que evitar
- `innerHTML` com conteúdo vindo do usuário ou de API sem sanitização.
- Funções gigantes com múltiplas responsabilidades.
- Estado global espalhado em `window.*`.
- Polling com `setInterval` quando WebSocket ou evento nativo resolve.
- Código sincrono bloqueante para operações de I/O.
- Dependência de ordem de carregamento de scripts sem módulos explícitos.

## Referências
- [MDN Web Docs: JavaScript](https://r.jina.ai/https://developer.mozilla.org/en-US/docs/Web/JavaScript)
- [MDN: Fetch API](https://r.jina.ai/https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API)
- [MDN: ES Modules](https://r.jina.ai/https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules)
