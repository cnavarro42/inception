FROM debian:buster

RUN	apt-get -y update && \
	apt-get -y upgrade && \
#install MariaDB
	apt-get -y install mariadb-server mariadb-client mariadb-common gettext-base

COPY	./conf/commands.sh .

RUN	chmod +x commands.sh

#Running script and daemonize
RUN service mysql start && bash commands.sh
CMD ["mysqld_safe"]
