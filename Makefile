PATH_DOCKERYML = ./srcs/docker-compose.yml

all:
	@sudo docker compose -f $(PATH_DOCKERYML) up -d --build

re: clean all

stop:
	@sudo docker compose -f $(PATH_DOCKERYML) stop

clean: stop
	@sudo docker compose -f $(PATH_DOCKERYML) down -v

fclean: clean
	@sudo docker system prune -af
	sudo rm -rf /home/maquentr/data/db
	sudo rm -rf /home/maquentr/data/wordpress
		
	mkdir -p /home/maquentr/data/db
	mkdir -p /home/maquentr/data/wordpress

.PHONY: all re stop clean fclean