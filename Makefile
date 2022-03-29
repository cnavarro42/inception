all:
	docker build -t nginx_image ./srcs/requirements/nginx
	docker-compose -f ./srcs/docker-compose.yaml up -d
	docker logs nginx_container
fclean:
	docker-compose -f ./srcs/docker-compose.yaml stop
	docker system prune -a
re: fclean all

.PHONY: all fclean re
