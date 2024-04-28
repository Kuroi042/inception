#!/bin/bash

# Correct path to wp-config.php
WP_CONFIG="/var/www/wordpress/wp-config.php"

# Check if wp-config.php exists and delete it if found
if [ -f "$WP_CONFIG" ]; then
  echo "Deleting existing wp-config.php file..."
  rm "$WP_CONFIG"
fi
echo "---------------------------->nebdaw lkhedma "




wp --allow-root config create --dbname="$MADB_NAME" --dbuser="$MADB_USER" --dbpass="$MADB_PASSWORD" --dbhost="$MADB_HOST"
wp --allow-root core install --url="$DOMAIN_NAME"/ --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASS" --admin_email="$WP_ADMIN_EMAIL"
chmod -R 755 wp-content/uploads
echo "Database credentials updated with values from environment variables."

exec "$@"