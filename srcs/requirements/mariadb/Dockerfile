FROM 	debian:buster

ARG	MYSQL_USER MYSQL_PASSWORD MYSQL_ROOT_PASSWORD MYSQL_DATABASE MYSQL_SUPERUSER MYSQL_SUPERPASSWORD

RUN	apt-get -y update && \
	apt-get -y upgrade && \
#install MariaDB
	apt-get -y install mariadb-server mariadb-client mariadb-common gettext-base

COPY	./conf/commands.sh .

RUN	chmod +x commands.sh

RUN 	sed -i "s/MYSQL_USER/${MYSQL_USER}/g" ./commands.sh && \
	sed -i "s/MYSQL_PASSWORD/${MYSQL_PASSWORD}/g" ./commands.sh && \
	sed -i "s/MYSQL_ROOT_PASSWORD/${MYSQL_ROOT_PASSWORD}/g" ./commands.sh && \
	sed -i "s/MYSQL_DATABASE/${MYSQL_DATABASE}/g" ./commands.sh && \
	sed -i "s/MYSQL_SUPERPASSWORD/${MYSQL_SUPERPASSWORD}/g" ./commands.sh && \
	sed -i "s/MYSQL_SUPERUSER/${MYSQL_SUPERUSER}/g" ./commands.sh
#Running script and daemonize
RUN	service mysql start && ./commands.sh && \
	rm commands.sh

CMD 	["mysqld_safe"]
