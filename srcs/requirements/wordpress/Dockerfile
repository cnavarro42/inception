FROM debian:buster

ARG	MYSQL_USER MYSQL_PASSWORD MYSQL_HOSTNAME MYSQL_DATABASE

RUN	apt-get -y update && \
	apt-get -y upgrade && \
#Install all PHP dependencies
	apt-get -y install php php-common \
	php-cli php-fpm php-json php-pdo php-mysql php-zip \
	php-gd  php-mbstring php-curl php-xml php-pear php-bcmath && \
#Installing utilities
	apt-get -y install wget
COPY	./conf/wp-config.php /var/www/wordpress/
COPY	./conf/www.conf .	
RUN	mkdir /run/php && \
#Installing Wordpress
	wget https://wordpress.org/latest.tar.gz && \
	tar -xf latest.tar.gz && \
	rm latest.tar.gz && \
#Update configuration file
	rm -rf /etc/php/7.3/fpm/pool.d/www.conf && \
	mv www.conf /etc/php/7.3/fpm/pool.d/ && \
	rm -rf var/www/wordpress && \
	mkdir -p var/www/wordpress && \
	mv wordpress/* var/www/wordpress/ && \
	rmdir wordpress && \
	sed -i "s/username_here/$MYSQL_USER/g" var/www/wordpress/wp-config-sample.php && \
	sed -i "s/password_here/$MYSQL_PASSWORD/g" var/www/wordpress/wp-config-sample.php && \
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" var/www/wordpress/wp-config-sample.php && \
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" var/www/wordpress/wp-config-sample.php
WORKDIR	/var/www/html/
#Init nodaemonize mode
CMD	service php7.3-fpm start && service php7.3-fpm stop && php-fpm7.3 --nodaemonize
