CREATE DATABASE wordpress;
CREATE USER 'sumseo'@'%' IDENTIFIED BY 'sumi';
GRANT ALL PRIVILEGES ON *.* TO 'sumseo'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;