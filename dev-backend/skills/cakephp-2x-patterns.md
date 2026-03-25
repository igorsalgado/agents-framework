# CakePHP 2.x Patterns & Conventions

## General Rules
- **Version:** Strictly CakePHP 2.x.
- **Imports:** Use `App::uses('ClassName', 'Type')` (e.g., `App::uses('AppModel', 'Model')`).
- **Instantiation:** Use `ClassRegistry::init('ModelName')` for model instantiation, especially in tests or services.

## Model Layer
- Extend `AppModel`.
- Use `Containable` behavior for optimized queries.
- Define validations in the `$validate` array.

## Controller Layer
- Extend `AppController`.
- Keep actions minimal; delegate complex logic to Services or Models.
- Use `CakeLog::write('error', 'message')` for logging.

## Service Layer (Company Best Practice)
- Create services in `app/Lib/Service/` or `app/Service/`.
- Services handle business logic, external API integrations (e.g., eRede), and complex data processing.

## Anti-Patterns to Avoid
- `SELECT *` queries (specify fields).
- Raw SQL without parameter binding.
- Business logic inside `.ctp` files (Views).
- Hardcoded configuration (use `Configure::read()` and `.env`).
