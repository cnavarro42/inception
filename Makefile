COMPOSE = docker-compose -f ./srcs/docker-compose.yaml
DEBUG = docker exec -it
LOGS = docker logs
MKDIR = sudo mkdir -p /home/cnavarro/data/
all:
	$(MKDIR)wordpress
	$(COMPOSE) build
	$(COMPOSE) up -d
clean:
	$(COMPOSE) stop
fclean: clean
	sudo rm -rf /home/cnavarro/data/*
	docker system prune -af
	docker volume rm wordpress_volume
	docker volume rm db_volume
re: fclean all

debug: all
	$(LOGS) nginx_container
	$(LOGS) wordpress_container
	$(LOGS) mariadb_container
logs:
	$(LOGS) nginx_container
	$(LOGS) wordpress_container
	$(LOGS) mariadb_container


info:
	@echo "\nCONTAINERS:\n\n"
	@docker ps
	@echo "\n"
	@echo "IMAGES:\n\n"
	@docker images
	@echo "\n"

info2:	
	@echo "CONTAINERS OFF:\n\n"
	@docker ps -a
	@echo "IMAGES OFF:\n\n"
	@docker images -a

nginx:
	$(DEBUG) nginx_container /bin/bash
wordpress:
	$(DEBUG) wordpress_container /bin/bash
mariadb:
	$(DEBUG) mariadb_container /bin/bash
volumes:
	docker volume ls

.PHONY: all fclean re nginx wordpress mariadb volumes info info2 debug
