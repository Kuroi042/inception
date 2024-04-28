#!/bin/sh
set -x

# Ensure /run/mysqld directory exists
if [ ! -d "/run/mysqld" ]; then
    mkdir /run/mysqld
fi

# Generate SQL script
cat << EOF > /tmp/wp.sql
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS ${MADB_NAME};
CREATE USER IF NOT EXISTS '${MADB_USER}'@'%' IDENTIFIED BY '${MADB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MADB_NAME}.* TO '${MADB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

# Execute SQL script in bootstrap mode
mysqld --user=root --bootstrap < /tmp/wp.sql

echo "zaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab"

# Execute additional commands
exec "$@"
