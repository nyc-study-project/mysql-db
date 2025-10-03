# mysql-db

Central database for the NYC Study Projects system.

This repo contains the SQL schema, sample seed data, and a small helper script to
apply both to a MySQL instance (e.g., your GCP VM).


## Contents

- `schema/2025-10-02_init.sql` — creates DB `mydb` and tables
  - `students` (id, name, email, created_at)
  - `courses` (id, code, title, created_at)
  - `enrollments` (student_id, course_id, enrolled_at; FK → students/courses)
- `seed/dev_seed.sql` — demo data for development
- `scripts/apply_dev.sh` — applies schema and then seeds
- `.env.example` — template with connection variables
- `.gitignore` — ignores `.env`, logs, etc.

See the full DDL here: [`schema/2025-10-02_init.sql`](schema/2025-10-02_init.sql).


## Requirements

- MySQL client (`mysql`) available in your shell
- Network access to the database host and port (e.g., 3306)
- A DB user with privileges to create tables and insert data


## Setup (GCP VM)

```bash
# one-time on the VM
sudo apt update
sudo apt install -y git mysql-client

git clone https://github.com/nyc-study-project/mysql-db.git
cd ~/mysql-db

# create your local env file from the template
cp .env.example .env
nano .env
# Example values:
# DB_HOST=127.0.0.1
# DB_PORT=3306
# DB_NAME=mydb
# DB_USER=avi
# DB_PASS=columbia25
