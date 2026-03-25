# Skill: Design Patterns

## Quando usar
Use esta skill para escolher, aplicar ou revisar design patterns quando a solução precisar reduzir acoplamento, encapsular variação, organizar criação de objetos, adaptar integrações ou distribuir responsabilidades com mais clareza.

## Padrão Sênior
- Tratar patterns como toolkit e linguagem comum, não como objetivo em si.
- Começar pelo problema de design antes de nomear o pattern.
- Escolher o menor pattern que resolva a dor real de evolução, teste ou legibilidade.
- Adaptar o pattern ao contexto da linguagem e do projeto, sem copiar a estrutura "ao pé da letra".
- Confirmar que o pattern melhora contrato, manutenção e previsibilidade operacional.

## Mapa Rápido de Decisão
- **Creational**: use quando a criação de objetos estiver complexa, acoplada demais ou variar por contexto.
  - `Factory Method`, `Abstract Factory`, `Builder`, `Prototype`
- **Structural**: use quando o problema for composição, adaptação de interfaces ou camadas de integração.
  - `Adapter`, `Facade`, `Decorator`, `Proxy`, `Composite`, `Bridge`, `Flyweight`
- **Behavioral**: use quando a dificuldade estiver em variação de comportamento, fluxo, colaboração ou troca de responsabilidades.
  - `Strategy`, `State`, `Command`, `Observer`, `Template Method`, `Chain of Responsibility`, `Mediator`, `Visitor`, `Iterator`, `Memento`

## Sinais de Uso
- Muitos `if/elif` para selecionar algoritmo, regra ou fluxo.
- Construção de objetos ou payloads com passos demais ou combinações difíceis.
- Integração com API legado, SDK ruim ou contrato externo inconsistente.
- Responsabilidades transversais como cache, autenticação, retry ou auditoria.
- Objetos conhecem detalhes demais uns dos outros para colaborar.

## Critérios Práticos
- Se uma função, composição simples ou interface explícita resolve, prefira isso antes de introduzir um pattern formal.
- Em Python, closures, funções de primeira classe, protocolos e composição podem substituir versões mais pesadas de alguns patterns.
- Use patterns para tornar intenção e evolução mais claras, não para impressionar com arquitetura.
- Valide a mudança com testes e refatoração incremental; pattern sem feedback rápido costuma virar sobreengenharia.

## O que evitar
- Aplicar pattern só porque ele existe no catálogo.
- Usar `Singleton` como atalho para estado global.
- Reproduzir diagramas clássicos sem adaptar ao domínio e à linguagem.
- Introduzir abstrações extras antes de existir variação real.
- Trocar código simples por uma hierarquia difícil de navegar.

## Relação com Refactoring
- Patterns ajudam a nomear soluções recorrentes.
- Refactoring ajuda a chegar nelas com segurança, passo a passo, sem mudar comportamento externo.
- Se o código ainda está rígido, acoplado ou cheio de smells, normalmente vale refatorar antes de consolidar um pattern.

## Referências
- [Refactoring.Guru: Design Patterns](https://r.jina.ai/https://refactoring.guru/design-patterns)
- [Refactoring.Guru: Catalog of Design Patterns](https://r.jina.ai/https://refactoring.guru/design-patterns/catalog)
- [Refactoring.Guru: Why Should I Learn Patterns?](https://r.jina.ai/https://refactoring.guru/design-patterns/why-learn-patterns)
- [Refactoring.Guru: Classification of Patterns](https://r.jina.ai/https://refactoring.guru/design-patterns/classification)
- [Refactoring.Guru: Criticism of Patterns](https://r.jina.ai/https://refactoring.guru/design-patterns/criticism)
- [Refactoring.Guru: Refactoring](https://r.jina.ai/https://refactoring.guru/refactoring)
