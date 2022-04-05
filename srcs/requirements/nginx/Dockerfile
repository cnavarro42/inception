FROM debian:buster

RUN 	apt-get -y update && \
	apt-get -y upgrade && \
#Instalamos nginx y openssl
	apt-get -y install nginx && \
	apt-get -y install openssl && \
#Borramos la configuración por defecto
	rm -rf /etc/nginx/sites-abailable/default && \
#Creamos un directorio para el certificado ssl
	mkdir /etc/nginx/ssl && \
	chmod 750 /etc/nginx/ssl && \
#Creamos el certificado ssl
	openssl req -nodes -x509 -days 30 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/cnavarro.key \
	-out /etc/nginx/ssl/cnavarro.crt \
	-subj "/C=SP/ST=Spain/L=Madrid/O=42Madrid/OU=cnavarro/CN=localhost"

#Copiamos la configuración de nginx
COPY	/conf/default /etc/nginx/sites-available

#Iniciamos en modo daemon off para que el contenedor se mantenga encendido
CMD 	["nginx", "-g", "daemon off;"]
