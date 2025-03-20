FROM debian:bullseye

# Install MariaDB
RUN apt-get update && apt install -y mariadb-server 

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.

COPY init.sql /etc/mysql/init.sql

RUN mkdir /run/mysqld

CMD ["mysqld_safe"]
