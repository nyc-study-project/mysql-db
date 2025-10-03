# mysql-db

Central database for the NYC Study Projects system.

This repo contains the SQL schema, sample seed data, and a small helper script to
apply both to a MySQL instance (e.g., your GCP VM).

---

## Contents

- `schema/2025-10-02_init.sql` – creates the database (`mydb`) and tables
  - `students` (id, name, email, created_at)
  - `courses` (id, code, title, created_at)
  - `enrollments` (student_id, course_id, enrolled_at)
- `seed/dev_seed.sql` – inserts a few demo rows for local/dev testing
- `scripts/apply_dev.sh` – applies the schema and then seeds the DB
- `.env.example` – template with the connection variables
- `.gitignore` – excludes `.env`, logs, etc.

See the full DDL here: [`schema/2025-10-02_init.sql`](schema/2025-10-02_init.sql).

---

## Requirements

- MySQL client (`mysql`) available in your shell
- Network access to the database host and port (e.g., 3306)
- A DB user with privileges to create tables and insert data

---

## Quick Start

1) **Create your local `.env` from the template**

```bash
cp .env.example .env
# edit .env and enter your real password locally (do NOT commit .env)
