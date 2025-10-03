#!/usr/bin/env bash
# scripts/apply_dev.sh
set -euo pipefail

# Require env vars (these will usually come from your local .env)
: "${DB_HOST:?Missing DB_HOST}"
: "${DB_PORT:?Missing DB_PORT}"
: "${DB_NAME:?Missing DB_NAME}"
: "${DB_USER:?Missing DB_USER}"
: "${DB_PASS:?Missing DB_PASS}"

echo "Applying schema to ${DB_NAME} on ${DB_HOST}:${DB_PORT} as ${DB_USER}…"
mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/2025-10-02_init.sql

echo "Seeding ${DB_NAME}…"
mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < seed/dev_seed.sql

echo "✔ Done."
