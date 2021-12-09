
all:
	docker-compose -p inception -f srcs/docker-compose.yml up -d --build

clean:
	docker-compose -p inception -f srcs/docker-compose.yml down

fclean:
	docker-compose -p inception -f srcs/docker-compose.yml down --rmi all --volumes

re: fclean all

.PHONY: all clean fclean re
