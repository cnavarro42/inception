mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;"

mysql -e "CREATE USER IF NOT EXISTS 'MYSQL_USER'@'localhost';"
mysql -e "SET PASSWORD FOR 'MYSQL_USER'@'localhost' = PASSWORD('MYSQL_PASSWORD');"
#mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$MARIADB_USER'@'localhost' IDENTIFIED BY '$DB_USR_PWD';"
#mysql -e "FLUSH PRIVILEGES;"

#mysql -e "CREATE USER IF NOT EXISTS '$DB_SUPER'@'localhost' IDENTIFIED BY '$DB_SUPER_PWD';"
#mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_SUPER'@'localhost' WITH GRANT OPTION;"
#mysql -e "FLUSH PRIVILEGES;"

#mysql -e "ALTER USER '$R_USR'@'localhost' IDENTIFIED BY '$R_USR_PWD';"
