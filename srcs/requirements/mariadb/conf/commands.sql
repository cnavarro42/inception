CREATE DATABASE IF NOT EXISTS MARIADB_DB;

CREATE USER IF NOT EXISTS 'user'@'localhost';
SET PASSWORD FOR 'user'@'localhost' = PASSWORD('password');
GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;

CREATE USER IF NOT EXISTS 'superuser'@'localhost' IDENTIFIED BY 'superpassword';
GRANT ALL PRIVILEGES ON *.* TO 'superuser'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY 'super';
