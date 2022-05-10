FROM debian:buster

ARG	MYSQL_USER
ARG	MYSQL_PASSWORD

RUN	apt-get -y update && \
	apt-get -y upgrade && \
#install MariaDB
	apt-get -y install mariadb-server mariadb-client mariadb-common gettext-base

COPY	./conf/commands.sh .

RUN	chmod +x commands.sh

RUN sed -i "s/MYSQL_USER/${MYSQL_USER}/g" ./commands.sh
RUN sed -i "s/MYSQL_PASSWORD/${MYSQL_PASSWORD}/g" ./commands.sh
#Running script and daemonize
RUN service mysql start && ./commands.sh
CMD ["mysqld_safe"]
