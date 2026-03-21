# Skill: Compose

## Quando usar
Use esta skill para subir ambientes locais ou de homologação leves, com múltiplos serviços, dependências explícitas e operação simples para time de desenvolvimento e QA.

## Padrão Sênior
- Usar Compose para orquestração pequena e objetiva, não para simular plataforma complexa.
- Declarar serviços, redes, volumes e dependências de forma explícita.
- Nomear serviços pelo papel operacional que cumprem.
- Manter configuração previsível para quem sobe e depura o ambiente.
- Tratar ordem de prontidão com healthchecks e não só com `depends_on`.

## Checklist Base
- Serviços essenciais definidos com clareza.
- Redes, volumes e portas explícitos.
- Variáveis externas ao repositório quando necessário.
- Healthchecks ou critérios equivalentes de prontidão.
- Comandos simples para subir, inspecionar e derrubar o ambiente.

## O que evitar
- Compose que tenta espelhar uma plataforma inteira sem necessidade.
- Dependências implícitas entre serviços.
- Misturar ambiente local, CI e homologação sem critério.
- Arquivo longo e caótico sem agrupamento por responsabilidade.
- Considerar "container iniciou" como sinônimo de "serviço está pronto".

## Referências
- [Docker Compose File Reference](https://r.jina.ai/http://https://docs.docker.com/compose/compose-file/)
- [Compose Getting Started](https://r.jina.ai/http://https://docs.docker.com/compose/gettingstarted/)
- [Startup Order](https://r.jina.ai/http://https://docs.docker.com/compose/how-tos/startup-order/)

