all:
	docker build -t nginx_image ./srcs/containers/nginx
	docker-compose -f ./srcs/docker-compose.yaml up -d
fclean:
	docker-compose -f ./srcs/docker-compose.ymal stop
	docker-compose system prune -a
re: fclean all

.PHONY: all fclean re
