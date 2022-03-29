all:
	docker build -t nginx_image ./srcs/requirements/nginx
	docker build -t wordpress_image ./srcs/requirements/wordpress
	docker-compose -f ./srcs/docker-compose.yaml up -d
fclean:
	docker-compose -f ./srcs/docker-compose.yaml stop
	docker system prune -a
re: fclean all

debug: all
	docker logs nginx_container
	docker logs wordpress_container
info:
	@echo "CONTAINERS:\n\n"
	@docker ps
	@echo "IMAGES:\n\n"
	@docker images

info2:	
	@echo "CONTAINERS OFF:\n\n"
	@docker ps -a
	@echo "IMAGES OFF:\n\n"
	@docker images -a

nginx:
	docker exec -it nginx_container bash
wordpress:
	docker exec -it wordpress_container bash
mariadb:
	docker exec -it mariadb_container bash

.PHONY: all fclean re nginx wordpress mariadb info info2 debug
