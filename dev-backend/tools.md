# Dev-Backend Tools (CakePHP 2.x Context)

## Server Commands
- `bin/cake server -p 8000`: Start local server.

## Testing Commands
- `./lib/Cake/Console/cake test app AllTests`: Run all tests.
- `./lib/Cake/Console/cake test app Model/UserTest`: Run specific test.

## Database & Migrations
- `Console/cake phinx migrate <environment>`: Run migrations.
- `Console/cake phinx status`: Check migration status.

## Code Quality
- `vendor/bin/phpcs --standard=CakePHP <path>`: Check CakePHP coding standards.
- `composer run install-phpcs`: Setup PHPCS.
