FROM debian:buster

RUN	apt-get -y update && \
	apt-get -y upgrade && \
	apt-get -y install php php-common \
	php-cli php-fpm php-json php-pdo php-mysql php-zip \
	php-gd  php-mbstring php-curl php-xml php-pear php-bcmath
	#wget https://wordpress.org/latest.tar.gz tar && \
	#tar -xf latest.tar.gz && \
	#mv wordpress/ /var/www/wordpress
CMD	service  php7.3-fpm start && service php7.3-fpm stop && php-fpm7.3 --nodaemonize
