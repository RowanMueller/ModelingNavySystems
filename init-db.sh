#!/bin/bash
set -e

# Create the database user and grant privileges.
# Use an unquoted heredoc so env vars expand, and keep the delimiter flush-left.
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<EOSQL
GRANT ALL PRIVILEGES ON DATABASE "$POSTGRES_DB" TO "$POSTGRES_USER";
EOSQL