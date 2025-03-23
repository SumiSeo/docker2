#!/bin/bash

wp config create	--allow-root \
					--dbname="$DB_NAME" \
					--dbuser="$DB_ADMIN_NAME" \
					--dbpass="$DB_ADMIN_PWD" \
					--dbhost=mariadb \
					--path=/var/www/wordpress

wp core install --allow-root \
				--url=https://$DOMAIN/ \
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