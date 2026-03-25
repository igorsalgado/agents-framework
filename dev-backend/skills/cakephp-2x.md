# Skill: CakePHP 2.x (PHP 7.4)

## Quando usar
Use esta skill para desenvolver, refatorar ou revisar código em projetos CakePHP 2.x rodando em PHP 7.4 — controllers, models, views, services, migrations e testes.

## Padrão Sênior
- Usar `App::uses('ClassName', 'Type')` para todos os imports — nunca `require` ou `use` PSR-4.
- Usar `ClassRegistry::init('ModelName')` para instanciar models em services e testes.
- Manter controllers finos: toda lógica de negócio vai em services em `app/Lib/Service/` ou `app/Service/`.
- Usar `Containable` behavior para queries com relações — evitar N+1 explícito.
- Definir validações no array `$validate` do model, nunca no controller.
- Configurações e segredos ficam em `.env` lidos via `Configure::read()` — nunca hardcoded.
- Erros e eventos críticos são logados via `CakeLog::write('error', 'mensagem')`.

## Estrutura de Camadas
- **Controller** (`app/Controller/`): estende `AppController`, actions finas, delega ao service.
- **Model** (`app/Model/`): estende `AppModel`, validação, relacionamentos, queries específicas do domínio.
- **Service** (`app/Lib/Service/` ou `app/Service/`): lógica de negócio, integrações externas, processamento complexo.
- **View** (`app/View/`): extensão `.ctp`, apenas apresentação — sem lógica de negócio.
- **Lib** (`app/Lib/`): utilitários reutilizáveis que não se encaixam em Model ou Service.

## Convenções Obrigatórias
- Tabelas: plural `snake_case` (`payment_transactions`).
- Models: singular `CamelCase` (`PaymentTransaction`).
- Controllers: plural `CamelCase` + sufixo (`PaymentsController`).
- Métodos e variáveis: `camelCase`. Classes: `StudlyCaps`.
- Indentação: 4 espaços. Arquivos UTF-8 sem BOM. Padrão PSR-12.

## Testes (CakePHP 2.x)
- Testes ficam em `app/Test/Case/`, espelhando a estrutura de `app/`.
- Fixtures declaradas em `public $fixtures = array('app.model_name');`.
- Setup: `parent::setUp(); $this->Model = ClassRegistry::init('Model');`.
- Cobertura mínima: happy path + falhas de validação + casos de exceção.
- Comando: `./lib/Cake/Console/cake test app Model/NomeTest`

## Migrations
- Gerenciadas via Phinx: `Console/cake phinx migrate <environment>`.
- Sempre criar migration para qualquer mudança de schema.
- Migrations devem ter rollback seguro (`down()`).

## Checklist Base
- Imports via `App::uses()` corretos e completos.
- Controller delega para service ou model — sem lógica de negócio na action.
- Validações definidas no model.
- Nenhum segredo ou config hardcoded.
- Queries usam binding de parâmetros — nunca concatenação direta.
- Views `.ctp` sem PHP de negócio.
- Testes cobrindo sucesso e falha para cada método novo.
- Migration criada para mudanças de banco.

## O que evitar
- `SELECT *` em queries — especificar campos sempre.
- SQL cru sem binding de parâmetros.
- Lógica de negócio em `.ctp` (views).
- `require`/`include` direto — usar `App::uses()`.
- Fat controllers com lógica que pertence ao service ou model.
- Configuração hardcoded no código.

## Referências
- [CakePHP 2.x Cookbook](https://r.jina.ai/https://book.cakephp.org/2/en/index.html)
- [CakePHP 2.x Models](https://r.jina.ai/https://book.cakephp.org/2/en/models.html)
- [CakePHP 2.x Testing](https://r.jina.ai/https://book.cakephp.org/2/en/development/testing.html)
- [Phinx Migrations](https://r.jina.ai/https://book.cakephp.org/phinx/0/en/migrations.html)
