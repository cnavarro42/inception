FROM debian:buster

RUN	apt-get -y update && \
	apt-get -y upgrade && \
#instalamos MariaDB
	apt-get -y install mariadb-server mariadb-client
#llamamos al script para configurar y mantener el contenedor activo

COPY	./conf/script.sh .

RUN	chmod +x script.sh

ENTRYPOINT ["sh", "/script.sh"]
