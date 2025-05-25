#!/bin/bash
set -e

# Список баз данных
declare -A DB_SCHEMAS=(
    ["gateway"]="public"
    ["postgres"]="example_schema"
    ["dictionary"]="public"
)

for db in "${!DB_SCHEMAS[@]}"; do
    if [ "$db" != "postgres" ]; then
        echo "Создаю базу данных: $db"
        psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
            CREATE DATABASE $db;
EOSQL
    else
        echo "База $db уже существует, создаем только схемы"
    fi

    SCHEMAS=${DB_SCHEMAS[$db]}

    echo "Создаю схемы в $db: $SCHEMAS"
    for schema in $SCHEMAS; do
        if [ "$schema" != "public" ]; then
            psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname="$db" <<-EOSQL
                CREATE SCHEMA IF NOT EXISTS $schema;
EOSQL
        fi

        # Проверяем, есть ли SQL-скрипт для этой схемы
        SQL_FILE="/docker-entrypoint-initdb.d/sql/${db}_${schema}.sql"
        if [ -f "$SQL_FILE" ]; then
            echo "Выполняю SQL-скрипт: $SQL_FILE для базы $db, схемы $schema"
            psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname="$db" -f "$SQL_FILE"
        else
            echo "Скрипт $SQL_FILE не найден, пропускаем."
        fi
    done
done
