# mysql-db

Central database for the NYC Study Projects system.

This repo contains the SQL schema, sample seed data, and helper scripts to apply both to a MySQL instance (e.g., your GCP VM).

## Sprint 1 Proof

See **[docs/sprint1/README.md](docs/sprint1/README.md)** for screenshots of the VM, firewall, and MySQL verification.

If you’re browsing this repo directly, the images are here:

- `docs/sprint1/gce-vm-list.png` – GCE “VM instances” list showing name, **zone**, and **static** external IP  
- `docs/sprint1/vm-network-tag.png` – VM details page with the **network tag** (e.g., `mysql-server`) and the attached static IP  
- `docs/sprint1/firewall-allow-mysql.png` – Firewall rule targeted by the tag, allowing **tcp:3306** from Avi’s VM IP(s)  
- `docs/sprint1/mysql-proof.png` – Terminal proof (table list + row counts)

## Contents

- `schema/2025-10-02_init.sql` — creates DB **`mydb`** and tables  
  - `students` (id, name, email, created_at)  
  - `courses` (id, code, title, created_at)  
  - `enrollments` (student_id, course_id, enrolled_at; FKs → students/courses)
- `seed/dev_seed.sql` — demo data for development
- `scripts/apply_dev.sh` — applies schema and then seeds
- `scripts/reset_dev.sql` — safe truncate of demo data (FK checks handled)
- `.env.example` — connection variables template
- `.gitignore` — ignores `.env`, logs, etc.

See the full DDL here: [`schema/2025-10-02_init.sql`](schema/2025-10-02_init.sql).

## Requirements

- MySQL client (`mysql`) available in your shell/VM  
- Network access to the DB host/port (default **3306**)  
- A DB user with privileges to create tables and insert data

**Example (run as MySQL root, once):**
```sql
CREATE USER 'avi'@'%' IDENTIFIED BY 'REPLACE_ME';
GRANT ALL PRIVILEGES ON mydb.* TO 'avi'@'%';
FLUSH PRIVILEGES;



