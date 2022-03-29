FROM debian:buster

RUN 	apt-get -y update && \
	apt-get -y upgrade && \
	apt-get -y install nginx

RUN	rm -rf /etc/nginx/sites-abailable/default

COPY	/conf/default /etc/nginx/sites-available

CMD 	["nginx", "-g", "daemon off;"]
