FROM	debian:buster
#Variables like arguments
ARG	MYSQL_USER MYSQL_PASSWORD MYSQL_HOSTNAME MYSQL_DATABASE
#Copying config
COPY	./conf/www.conf .
COPY	./conf/wp-config.php wp-config.php
RUN	apt-get -y update && \
	apt-get -y upgrade && \
#Install all PHP dependencies
	apt-get -y install php php-common \
	php-cli php-fpm php-json php-pdo php-mysql php-zip \
	php-gd  php-mbstring php-curl php-xml php-pear php-bcmath && \
#Installing utilities
	apt-get -y install wget && \
	apt-get -y install curl && \
#Installing wp-cli
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
#Installing Wordpress with wp-client
	mkdir -p /var/www/wordpress && \
	chmod 775 /var/www/wordpress && \
	wp core download --allow-root --version=latest --path=var/www/wordpress && \
	mv wp-config.php /var/www/wordpress/ && \
	wp core install --allow-root --url='cnavarro.42.fr' --title='WordPress' --admin_user=database_user --admin_password=database_user_password --path='/var/www/wordpress' && \
	#wp config create --allow-root \ 
	#--dbname=wordpress \
	#--path=var/www/wordpress \
	#--dbuser=database_user \
	#--dbpass=database_user_password \
	#--dbhost=mariadb \
	#&& \
#Update configuration file
	rm -rf /etc/php/7.3/fpm/pool.d/www.conf && \
	mv www.conf /etc/php/7.3/fpm/pool.d/
	#mv wordpress/* var/www/wordpress/ && \
	#rmdir wordpress
	#sed -i "s/username_here/$MYSQL_USER/g" wp-config.php && \
	#sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php && \
	#sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config.php && \
	#sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php && \
	#mv wp-config.php var/www/wordpress/ && \
	#rm var/www/wordpress/wp-config-sample.php

#Init nodaemonize mode
CMD	service php7.3-fpm start && service php7.3-fpm stop && php-fpm7.3 --nodaemonize
