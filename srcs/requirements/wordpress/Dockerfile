FROM debian:bullseye

# Install necessary dependencies for adding the PHP repository
RUN apt-get update -y && \
    apt-get install -y \
    lsb-release \
    ca-certificates \
    apt-transport-https \
    curl && \
    curl -sS https://packages.sury.org/php/README.txt | bash - && \
    apt-get update -y

# Install PHP 7.4, PHP-FPM, and other necessary PHP extensions
RUN apt-get install -y \
    php7.4-fpm \
    php7.4-cli \
    php7.4-mysql \
    php7.4-mbstring \
    php7.4-xml \
    sendmail \
    vim \
    wget \
    curl

# Clean up unnecessary packages
RUN apt-get clean


# Copy the www.conf file to the container
# COPY www.conf /etc/php/7.4/fpm/pool.d/

# COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
# RUN chmod +x /usr/local/bin/entrypoint.sh

# ENTRYPOINT [ "entrypoint.sh" ]
