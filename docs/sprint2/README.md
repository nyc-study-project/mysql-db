## Sprint 2 – Cloud SQL Setup (User-Owned Instance)

This document describes the setup of the MySQL instance used for Sprint 2.  
The goal for this sprint was to provision a user-owned MySQL database, enable secure access for teammates, seed initial data, and make the instance usable by other microservices.

---

## 1. Overview

For Sprint 2, we created and configured:

- A Compute Engine VM running MySQL 8  
- A MySQL database (`mydb`) created and managed directly on the VM  
- Secure access via:
  - External IP whitelisting  
  - MySQL user-level host permissions  
  - SSH key–based VM login  
- Development utilities (schema, seed scripts, sanity checks)

This DB is now fully accessible for all teammates and compatible with Cloud Run microservices in later sprints.

---

## 2. VM & MySQL Setup

### 2.1 VM Details

- VM Name: `mysql-vm`  
- Region: `us-east1-b`  
- Type: `e2-micro`  
- External Static IP: `34.138.240.11`  
- Tags: `mysql-server`

### 2.2 Installed Components

- `mysql-server`  
- `mysql-client`

The MySQL service runs on port 3306 and is reachable from whitelisted IPs.

---

## 3. MySQL Configuration

### 3.1 MySQL User Setup

The main DB user for teammates:

- User: `avi`  
- Host: `%` (any host)  
- Privileges: `ALL` on `mydb.*`

This allows teammates to connect from their machines once their IPs are whitelisted.

### 3.2 Bind Address

Updated in `/etc/mysql/mysql.conf.d/mysqld.cnf`:

- `bind-address = 0.0.0.0`

This enables external network connections.

---

## 4. Firewall / Networking

### 4.1 VPC Firewall Rule

Rule name: `allow-mysql`

| Setting       | Value        |
|--------------|--------------|
| Protocol     | TCP          |
| Port         | 3306         |
| Target tags  | mysql-server |
| Source ranges| Individual whitelisted teammate IPs |

### 4.2 Whitelisted IPs

The following teammate IPs were added (all `/32`):

- Sadi 
- Brian 
- Pranav 
- Avi 
- Others as they shared updated IPs

---

## 5. Cloud SQL Studio–Style Access

Even though this is a VM-hosted MySQL instance, teammates connect using standard MySQL client settings:

- Host: `34.138.240.11`  
- Port: `3306`  
- User: `avi`  
- Password: (shared privately)  
- Database: `mydb`

This allows direct SQL execution, table browsing, and debugging.

Example connection from a terminal:

    mysql -u avi -p -h 34.138.240.11 -P 3306 mydb

---

## 6. Database Schema and Seeding

### 6.1 Schema File

Location in repo:

- `schema/2025-10-02_init.sql`

It creates the initial tables:

- `students`  
- `courses`  
- `enrollments`

### 6.2 Seed File

Location in repo:

- `seed/dev_seed.sql`

Contains development data for testing.

### 6.3 Applying Schema

From the VM (or any machine with access):

    mysql -u avi -p mydb < schema/2025-10-02_init.sql

### 6.4 Applying Seed Data

    mysql -u avi -p mydb < seed/dev_seed.sql

---

## 7. Verification and Sanity Checks

After setup, we verified the database with basic queries.

Connect:

    mysql -u avi -p -h 34.138.240.11 -P 3306 mydb

Sanity SQL:

    SHOW TABLES;
    SELECT COUNT(*) FROM students;
    SELECT NOW();

These checks confirmed that tables exist, data is present, and time is correct.

---

## 8. Notes for Future Sprints

- This VM database will remain active until the team migrates fully to managed Cloud SQL instances.  
- Microservices should use the VM’s IP and `avi` credentials for now.  
- Any teammate changing networks must provide a new IPv4 address to be re-whitelisted.  
- If the `mysql-cloud-sql` Cloud SQL instance is retired later, the VM and `mydb` continue working independently.

