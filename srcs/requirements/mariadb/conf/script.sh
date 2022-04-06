#!/bin/bash

#Encendemos el servicio mysql
service mysql restart
sleep 5
#Creamos usuarios con sus contrase√as
mysql -e "CREATE DATABASE IF NOT EXISTS $(DB_NAME)"
mysql -e "GRANT ALL ON *.* TO '$(DB_USER)'@'localhost ' IDENTIFIED BY '$(DB_PWD)' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"



#totalmente temporal!!!!, para que el contenedor se mantenga activo
sleep infinity
