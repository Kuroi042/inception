#!/bin/bash

# Correct path to wp-config.php
WP_CONFIG="/var/www/wordpress/wp-config.php"

# Check if wp-config.php exists
if [ -f "$WP_CONFIG" ]; then
  rm $WP_CONFIG
fi

DB_NAME=$DB_NAME
DB_USER=$DB_USER
DB_PASSWORD=$DB_PASSWORD
DB_HOST=$DB_HOST

echo "DB_NAME: $DB_NAME"
echo "DB_USER: $DB_USER"
echo "DB_PASSWORD: $DB_PASSWORD"
echo "DB_HOST: $DB_HOST"

wp --allow-root config create --dbname=charaf --dbuser=user --dbpass=root --dbhost=mariadb:3306

echo "Database credentials updated with values from environment variables."

exec "$@"