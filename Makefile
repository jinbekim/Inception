include ./srcs/.env

COMPOSE = docker-compose -p inception -f srcs/docker-compose.yml

.PHONY: all
all:
	mkdir -p $(DB)
	mkdir -p $(WP)
	$(COMPOSE) up -d --build

.PHONY: up
up:
	$(COMPOSE) up -d

.PHONY: down
down:
	$(COMPOSE) down

.PHONY: mariadb
mariadb:
	$(COMPOSE) up -d mariadb

.PHONY: wordpress
wordpress:
	$(COMPOSE) up -d wordpress

.PHONY: nginx
nginx:
	$(COMPOSE) up -d nginx

.PHONY: fclean
fclean:
	$(COMPOSE) down --rmi all --volumes

.PHONY: re
re: fclean all
