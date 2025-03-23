FROM debian:bullseye

RUN apt-get update -y && \
    apt-get install -y \
    lsb-release \
    ca-certificates \
    apt-transport-https \
    curl && \
    curl -sS https://packages.sury.org/php/README.txt | bash - && \
    apt-get update -y

RUN apt-get install -y \
    php7.4-fpm \
    php7.4-cli \
    php7.4-mysql \
    php7.4-mbstring \
    php7.4-xml \
    sendmail \
    vim \
    wget \
    curl \
    mariadb-client

RUN apt-get clean

RUN wget https://wordpress.org/latest.tar.gz && \
	mkdir -p /var/www && \
	tar -xzf latest.tar.gz -C /var/www && \
	rm latest.tar.gz && \
	chmod -R 755 /var/www/wordpress && \
	chown -R root:root /var/www/wordpress

WORKDIR /var/www/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \ 
	mv wp-cli.phar /usr/local/bin/wp

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]
