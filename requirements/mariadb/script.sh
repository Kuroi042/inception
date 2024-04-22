#!/bin/bash

set -x

# Check if MySQL service is already running
if ! service mysql status > /dev/null; then
    # MySQL service is not running, start it
    service mysql start
fi

# Set MySQL root password
MYSQL_ROOT_PASSWORD="123"

# Define MySQL commands
SQL_COMMANDS=$(cat <<EOF
CREATE DATABASE IF NOT EXISTS charaf;
CREATE USER 'user'@'%' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON charaf.* TO 'user'@'%';
FLUSH PRIVILEGES;
EOF
)

# Execute MySQL commands using the provided root password
echo "$SQL_COMMANDS" | mysql 

# Check if MySQL command execution was successful
if [ $? -eq 0 ]; then
    echo "MySQL commands executed successfully."
else
    echo "Error: MySQL commands execution failed."
fi

echo "------------------> Script execution completed."

# Stop MySQL service
service mysql stop

# Execute other commands if provided
exec "$@"
