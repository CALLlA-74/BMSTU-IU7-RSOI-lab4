#!/usr/bin/env bash
set -e

# TODO для создания баз прописать свой вариант
export VARIANT="v2"
export SCRIPT_PATH=/docker-entrypoint-initdb.d/
export PGPASSWORD=test
psql -f "$SCRIPT_PATH/scripts/db-v2.sql"