#!/bin/sh

# check for /run/mysqld  is created 
if [ ! -d "/run/mysqld" ]; then
    mkdir /run/mysqld
fi

MADB_ROOT_PASSWORD=$(grep -oP '^MADB_ROOT_PASSWORD=\K.*' /run/secrets/maria_password)
MADB_PASSWORD=$(grep -oP '^MADB_PASSWORD=\K.*' /run/secrets/maria_password)
cat << EOF > /tmp/wp.sql
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS ${MADB_NAME};
CREATE USER IF NOT EXISTS '${MADB_USER}'@'%' IDENTIFIED BY '${MADB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MADB_NAME}.* TO '${MADB_USER}'@'%' IDENTIFIED BY '${MADB_PASSWORD}';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MADB_ROOT_PASSWORD}';
EOF

mysqld --user=root --bootstrap < /tmp/wp.sql
exec "$@"
