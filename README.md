# mysql-db

Central database for the NYC Study Projects system.

## Schema

Tables:
- `students` (id, name, email, created_at)
- `courses` (id, code, title, created_at)
- `enrollments` (student_id, course_id, enrolled_at)

See [`schema/2025-10-02_init.sql`](schema/2025-10-02_init.sql).

## Seeding

```bash
mysql -h $DB_HOST -u $DB_USER -p $DB_NAME < seed/dev_seed.sql

## Quick start

1. **Create `.env` from the template**
   ```bash
   cp .env.example .env
   # edit .env and enter the real password locally (do NOT commit .env)
