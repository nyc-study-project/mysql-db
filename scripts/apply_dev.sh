#!/usr/bin/env bash
set -euo pipefail

: "${DB_HOST:?}"; : "${DB_PORT:?}"; : "${DB_NAME:?}"; : "${DB_USER:?}"; : "${DB_PASS:?}"

mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/2025-10-02_init.sql
mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < seed/dev_seed.sql
echo "✔ Applied schema and seed to $DB_NAME on $DB_HOST:$DB_PORT"
