ENV = srcs/.env 
DATA = /home/sumseo/data


VOLUMES = $(DATA)/mariadb_data2 \
				$(DATA)/wordpress_data


all : $(ENV) $(VOLUMES)
	@docker compose -f srcs/docker-compose.yml up -d --build

$(ENV):
		@cp .env srcs/.env

$(VOLUMES):
		@mkdir -p $(VOLUMES)

down:
	@docker compose -f srcs/docker-compose.yml down


clean: down
		@if [ -n "$$(docker ps -q)" ]; then docker stop $$(docker ps -q); fi
		@docker container prune -f

fclean: clean
		docker volume prune -f
		@docker rmi $$(docker images -q)
		@docker system prune -f
		@docker compose -f srcs/docker-compose.yml down -v
		@rm -f srcs/.env

erase:
	@rm -rf $(DATA)

re: fclean all

logs:
	@docker compose -f srcs/docker-compose.yml logs


.PHONY : all clean re 