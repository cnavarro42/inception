FROM debian:buster

RUN	apt-get -y update && \
	apt-get -y upgrade && \
#Install all PHP dependencies
	apt-get -y install php php-common \
	php-cli php-fpm php-json php-pdo php-mysql php-zip \
	php-gd  php-mbstring php-curl php-xml php-pear php-bcmath && \
#Installing utilities
	apt-get -y install wget && \
#Installing Wordpress
	wget https://wordpress.org/latest.tar.gz && \
	tar -xf latest.tar.gz && \
	rm latest.tar.gz && \
	rm -rf var/www/wordpress && \
	mkdir -p var/www/wordpress && \
	mv wordpress/* var/www/wordpress/ && \
	rmdir wordpress && \
	rm var/www/wordpress/wp-config-sample.php
COPY	./conf/wp-config.php /var/www/wordpress/
#Init nodaemonize mode
CMD	service php7.3-fpm start && service php7.3-fpm stop && php-fpm7.3 --nodaemonize
