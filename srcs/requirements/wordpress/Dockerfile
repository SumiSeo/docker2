FROM php:7.4-fpm

RUN apt-get update && \
    apt-get install -y vim mariadb-client wget curl libpng-dev libjpeg-dev libfreetype6-dev && \
    docker-php-ext-install mysqli pdo pdo_mysql gd 

RUN wget https://wordpress.org/latest.tar.gz && \
    mkdir -p /var/www && \
    tar -xzf latest.tar.gz -C /var/www && \
    rm latest.tar.gz && \
    chmod -R 755 /var/www/wordpress && \
    chown -R www-data:www-data /var/www/wordpress

WORKDIR /var/www/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \ 
    mv wp-cli.phar /usr/local/bin/wp

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O adminer.php

EXPOSE 9000

COPY www.conf /etc/php/7.4/fpm/pool.d/.


CMD ["php-fpm", "-F"]
# CMD ["./script.sh"]
