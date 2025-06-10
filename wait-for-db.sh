#!/bin/sh

set -e

DB_HOST="db"
DB_PORT="5432"
DB_USER="web_user"
DB_NAME="webapp_db"

MAX_ATTEMPTS=30
ATTEMPT=0

echo "Ожидание готовности PostgreSQL на $DB_HOST:$DB_PORT..."

until pg_isready -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME"; do
  ATTEMPT=$((ATTEMPT+1))
  if [ $ATTEMPT -ge $MAX_ATTEMPTS ]; then
    echo "Не удалось подключиться к PostgreSQL после $MAX_ATTEMPTS попыток"
    exit 1
  fi
  echo "Попытка $ATTEMPT/$MAX_ATTEMPTS: PostgreSQL ещё не готов, ждём 2 секунды..."
  sleep 2
done

echo "PostgreSQL готов!"