#!/bin/bash

SECONDS=0
while ! mysqladmin ping -h mariadb --silent; do
	echo "Waiting for MariaDB to start... ${SECONDS} seconds elapsed"
	sleep 1
done

# wait for the wordpress database to be accessible
until echo "SHOW DATABASES;" | mysql -h mariadb -u"$DB_ADMIN_NAME" -p"$DB_ADMIN_PWD" | grep -q "$DB_NAME"; do
	echo "Waiting for WordPress database to be accessible... ${SECONDS} seconds elapsed"
	sleep 1
done

wp config create	--allow-root \
					--dbname="$DB_NAME" \
					--dbuser="$DB_ADMIN_NAME" \
					--dbpass="$DB_ADMIN_PWD" \
					--dbhost=mariadb \
					--path=/var/www/wordpress \
                    --force

wp core install --allow-root \
				--url=http://$DOMAIN/ \
				--title=$WP_TITLE \
				--admin_user=$DB_ADMIN_NAME \
				--admin_password=$DB_ADMIN_PWD \
				--admin_email=$DB_ADMIN_EMAIL \
				--path=/var/www/wordpress

wp user create	--allow-root \
				"$DB_USER_NAME" \
				"$DB_USER_EMAIL" \
				--user_pass="$DB_USER_PWD" \
				--role=author \
				--path=/var/www/wordpress

mkdir -p /run/php
exec /usr/sbin/php-fpm7.4 -F