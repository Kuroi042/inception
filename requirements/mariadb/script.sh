#!/bin/sh
set -x

# Ensure /run/mysqld directory exists
if [ ! -d "/run/mysqld" ]; then
    mkdir /run/mysqld
fi

# Generate SQL script
cat << EOF > /tmp/wp.sql
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS charaf;
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON charaf.* TO 'user'@'%';
FLUSH PRIVILEGES;
EOF

# Execute SQL script in bootstrap mode
mysqld --user=root --bootstrap < /tmp/wp.sql

echo "zaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab"

# Execute additional commands
exec "$@"
