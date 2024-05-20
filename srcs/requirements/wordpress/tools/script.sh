#!/bin/sh


WP_CONFIG="/var/www/wordpress/wp-config.php"

if [ -f "$WP_CONFIG" ]; then
  echo "Deleting existing wp-config.php file..."
  rm "$WP_CONFIG"
fi
echo "---------------------------->executing the script "
MADB_ROOT_PASSWORD=$(grep -oP '^MADB_ROOT_PASSWORD=\K.*' /run/secrets/maria_password)
MADB_PASSWORD=$(grep -oP '^MADB_PASSWORD=\K.*' /run/secrets/maria_password)
WP_ADMIN_PASS=$(grep -oP '^WP_ADMIN_PASS=\K.*' /run/secrets/wp_user_pass)
WP_USERPWD=$(grep -oP '^WP_USERPWD=\K.*' /run/secrets/wp_user_pass)

# echo "MADB_ROOT_PASSWORD: $MADB_ROOT_PASSWORD"
# echo "MADB_PASSWORD: $MADB_PASSWORD"
# echo "WP_ADMIN_PASS: $WP_ADMIN_PASS"
# echo "WP_USERPWD: $WP_USERPWD"

wp --allow-root config create --dbname="$MADB_NAME" --dbuser="$MADB_USER" --dbpass="$MADB_PASSWORD" --dbhost="$MADB_HOST"
wp --allow-root core install --url="$DOMAIN_NAME"/ --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASS" --admin_email="$WP_ADMIN_EMAIL"

wp user list --allow-root --path=/var/www/wordpress --field=user_login | grep -q ${WP_USER}
if [ $? != 0 ]; then
	wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_USERPWD --allow-root
echo "user is created succesfully"
echo "Database credentials updated with values from environment variables."
fi


chmod -R 755 wp-content/uploads

exec "$@"