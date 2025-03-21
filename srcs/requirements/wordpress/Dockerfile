FROM php:7.4-fpm

RUN apt-get update && \
    apt-get install -y vim mariadb-client wget curl libpng-dev libjpeg-dev libfreetype6-dev && \
    docker-php-ext-install mysqli pdo pdo_mysql gd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://wordpress.org/latest.tar.gz && \
    mkdir -p /var/www/wordpress_data/var/www && \
    tar -xzf latest.tar.gz -C /var/www/wordpress_data/var/www && \
    rm latest.tar.gz && \
    chmod -R 755 /var/www/wordpress_data/var/www/wordpress && \
    chown -R www-data:www-data /var/www/wordpress_data/var/www/wordpress

WORKDIR /var/www/wordpress


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY www.conf /etc/php/7.4/fpm/pool.d/

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]
