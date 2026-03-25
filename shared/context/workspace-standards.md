# Workspace Standards (Company Apps)

## Ticket Lifecycle (Mandatory)
Every development task must follow the `.vscode/.ticket/` structure inside the project:
- `ticket.md`: User input.
- `review.md`: Agent's deep analysis and questions.
- `action.md`: Detailed implementation plan (generated after questions are answered).
- `pr-ticket.md`: Implementation summary for review.
- `review-pr.md`: Final code review against master.

## Coding Principles
- **Thin Controllers, Fat Services:** Business logic belongs in Service classes.
- **PSR-12 Adherence:** 4-space indentation, StudlyCaps for classes, camelCase for methods, snake_case for DB columns.
- **Migration First:** Never modify schemas without a migration file.
- **Security:** Strict avoidance of raw SQL (use prepared statements) and unescaped outputs (XSS).

## Project List
- `agendamento-sampletrip` (Laravel)
- `agility` (CakePHP 2.x)
- `getolddata` (PHP)
- `pws` (CakePHP 2.x)
- `re-solution` (PHP)
- `sandbox` (Misc)
- `time2` (CakePHP 2.x)
- `unify` (CakePHP 2.x)
