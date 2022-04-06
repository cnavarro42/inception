FROM debian:buster

RUN	apt-get -y update && \
	apt-get -y upgrade && \
#Instalamos Todas las dependencias de PHP
	apt-get -y install php php-common \
	php-cli php-fpm php-json php-pdo php-mysql php-zip \
	php-gd  php-mbstring php-curl php-xml php-pear php-bcmath && \
#Instalamos utilidades
	apt-get -y install wget && \
#Instalamos Wordpress
	wget https://wordpress.org/latest.tar.gz && \
	tar -xf latest.tar.gz && \
	rm latest.tar.gz && \
	mv wordpress/ var/www/
#Iniciamos modo nodaemonize para que el contenedor se mantenga activo
CMD	service  php7.3-fpm start && service php7.3-fpm stop && php-fpm7.3 --nodaemonize
