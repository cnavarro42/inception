FROM debian:buster

RUN	apt-get -y update && \
	apt-get -y upgrade && \
#install MariaDB
	apt-get -y install mariadb-server mariadb-client mariadb-common

COPY	./conf/commands.sql .

RUN	chmod +x commands.sql

#Running script and daemonize
RUN service mysql start && mysql < commands.sql
CMD ["mysqld"]
