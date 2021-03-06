COMPOSE = docker-compose -f ./srcs/docker-compose.yaml
DEBUG = docker exec -it
LOGS = docker logs
MKDIR = sudo mkdir -p /home/cnavarro/data/
all:
	$(MKDIR)wordpress
	$(MKDIR)db
	$(COMPOSE) build
	$(COMPOSE) up -d
clean:
	$(COMPOSE) stop
fclean: clean
	sudo rm -rf /home/cnavarro/data/*
	docker system prune -af
	docker volume rm -f wordpress_volume
	docker volume rm -f db_volume
restart:
	$(COMPOSE) stop
	$(COMPOSE) start
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
	@echo "\nVOLUMES:\n\n"
	@docker volume ls
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
help:
	@echo "re: recreate proyect"
	@echo "debug: create proyect & show logs"
	@echo "logs: show logs"
	@echo "info: show containers, images & volumes ON"
	@echo "info2: show containers, images & volumes ON and OFF"
	@echo "nginx | wordpress | mariadb: Interactive terminal of container"
	@echo "volumes: List of volumes"
	@echo "restart: Stop and Start containers"
	@echo "help: show this pannel"
.PHONY: all fclean re nginx wordpress mariadb volumes info info2 debug help
