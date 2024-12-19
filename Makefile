.PHONY: all clean up down stop start env secrets status

all:  up

clean:
	@sudo docker system prune -af

up: secrets env
	@mkdir -p /home/mbouderr/data/mariadb
	@mkdir -p /home/mbouderr/data/wordpress
	@echo "Volumes created!"
	@docker-compose -f ./srcs/docker-compose.yml up --build -d

down:
	@docker-compose -f ./srcs/docker-compose.yml down -v
	@echo "Deleting volumes"
	@sudo rm -rf /home/mbouderr/data/*
	@echo "Volumes deleted"
	@sudo rm -rf secrets/
	@sudo rm -rf ./srcs/.env
	@sudo rm -rf ./secrets/maria_password.txt
	@sudo rm -rf ./secrets/wp_user_pass.txt
	@echo "Secret files deleted successfully"
	@echo "Environment deleted"

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop

start:
	@docker-compose -f ./srcs/docker-compose.yml start

env:
	@touch ./srcs/.env

secrets:
	@echo "Creating secret files"
	@sudo mkdir secrets 


status:
	@docker ps
