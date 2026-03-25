# Skill: jQuery

## Quando usar
Use esta skill para manipulação de DOM, eventos, AJAX e interações de interface em projetos que usam jQuery — especialmente em templates `.ctp` do CakePHP onde jQuery é a biblioteca principal de frontend.

## Padrão Sênior
- Encapsular todo código jQuery em `$(document).ready()` ou `$(function() { })`.
- Usar seletores semânticos baseados em `data-*` ou IDs, não em classes de estilo.
- Centralizar chamadas AJAX em funções reutilizáveis em vez de replicar `$.ajax()` em cada handler.
- Separar JavaScript dos templates `.ctp` — arquivos `.js` dedicados por funcionalidade.
- Tratar sempre os callbacks de erro do AJAX — nunca assumir que a requisição vai ter sucesso.
- Destruir eventos e plugins ao remover elementos do DOM para evitar memory leak.

## Boas Práticas
- Cachear seletores jQuery usados mais de uma vez: `const $form = $('#payment-form');`.
- Usar delegação de eventos para elementos dinâmicos: `$(document).on('click', '.btn-dynamic', fn)`.
- Preferir `$.ajax()` com `JSON` explícito a `$.get()` / `$.post()` para controle de headers e erros.
- Usar `data-*` attributes para passar dados do backend PHP para o JS sem globals.
- Validar formulários no frontend apenas como UX — a validação real é sempre no backend.
- Manter arquivos JS organizados por página ou módulo funcional.

## Checklist Base
- Todo código dentro de `$(document).ready()`.
- Seletores estáveis baseados em `id` ou `data-*`, não em estrutura de classe CSS.
- AJAX com handlers de sucesso e erro explícitos.
- Sem lógica de negócio no JS — apenas interação e apresentação.
- Feedback visual ao usuário durante operações assíncronas (loading state).
- Sem `console.log` em código de produção.

## O que evitar
- Seletores frágeis baseados em estrutura HTML (`$('div > ul > li:first')`).
- Inline JavaScript em templates `.ctp`.
- AJAX sem tratamento de erro.
- Manipulação direta de HTML como string: `$('#el').html('<div>' + userInput + '</div>')` — risco de XSS.
- Múltiplos `$(document).ready()` espalhados no mesmo arquivo.
- Globals JavaScript para passar estado entre páginas.

## Referências
- [jQuery API Documentation](https://r.jina.ai/https://api.jquery.com/)
- [jQuery Learning Center](https://r.jina.ai/https://learn.jquery.com/)
- [OWASP: DOM-based XSS Prevention](https://r.jina.ai/https://cheatsheetseries.owasp.org/cheatsheets/DOM_based_XSS_Prevention_Cheat_Sheet.html)
