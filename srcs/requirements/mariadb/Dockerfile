FROM debian:bullseye

# Install MariaDB
RUN apt-get update && apt install -y mariadb-server 

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.

# COPY init.sql /etc/mysql/init.sql

# RUN mkdir /run/mysqld

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
RUN	chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]

# CMD ["mysqld_safe"]
