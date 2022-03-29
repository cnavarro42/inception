FROM debian:buster

RUN 	apt-get -y update && \
	apt-get -y upgrade && \
	apt-get -y install nginx && \
	apt-get -y install openssl && \
	rm -rf /etc/nginx/sites-abailable/default

RUN	mkdir /etc/nginx/ssl && \
	chmod 750 /etc/nginx/ssl && \
	openssl req -nodes -x509 -days 30 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/cnavarro.key \
	-out /etc/nginx/ssl/cnavarro.crt \
	-subj "/C=SP/ST=Spain/L=Madrid/O=42Madrid/OU=cnavarro/CN=localhost"


COPY	/conf/default /etc/nginx/sites-available

CMD 	["nginx", "-g", "daemon off;"]
