# Security and Performance (Review Checklist)

## Security Vulnerabilities
- **SQL Injection:**
  - ❌ `$query = "SELECT * FROM users WHERE id = " . $id;`
  - ✅ Use CakePHP ORM: `$this->User->find('first', array('conditions' => array('id' => $id)));`
  - ✅ Use Prepared Statements: `$db->prepare("SELECT * FROM users WHERE id = ?");`
- **XSS (Cross-Site Scripting):**
  - ❌ `echo $user->name;` (in views)
  - ✅ Use CakePHP helper: `echo h($user->name);`
- **Sensitive Data Exposure:**
  - ❌ `CakeLog::write('info', 'CC: ' . $cardNumber);`
  - ✅ Mask data: `CakeLog::write('info', 'CC: ' . mask($cardNumber));`

## Performance & Optimization
- **N+1 Queries:**
  - Avoid fetching associations inside loops.
  - ✅ Use `Containable` behavior to eager-load associations in a single query.
- **SELECT Optimization:**
  - ❌ `SELECT *` from large tables.
  - ✅ Select only needed fields: `array('fields' => array('id', 'name'))`.
- **Database Indexes:**
  - Verify that `WHERE` or `ORDER BY` clauses are applied to indexed columns.
  - Check migrations for `add_index` or `index` definitions.
