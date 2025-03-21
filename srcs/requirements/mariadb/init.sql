CREATE DATABASE IF NOT EXISTS `${DB_NAME}`;
CREATE USER '${DB_USER_NAME}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}';
GRANT ALL PRIVILEGES ON `${DB_NAME}`.* TO '${DB_USER_NAME}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
