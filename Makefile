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
	@echo "Creating environment file"
	@echo "DOMAIN_NAME=mbouderr.42.fr" > ./srcs/.env
	@echo "MADB_NAME=inceptiondb" >> ./srcs/.env
	@echo "MADB_HOST=mariadb:3306" >> ./srcs/.env
	@echo "WP_USER=charaf" >> ./srcs/.env
	@echo "WP_TITLE=my wordpress page" >> ./srcs/.env
	@echo "WP_ADMIN_EMAIL=charaf@gmail.com" >> ./srcs/.env
	@echo "WP_EDMIN_USER=superuser" >> ./srcs/.env
	@echo "WP_AMAIL=user@gmail.com" >> ./srcs/.env
	@echo "Environment created successfully"

secrets:
	@echo "Creating secret files"
	@sudo mkdir secrets 
	@touch ./secrets/maria_password.txt
	@touch ./secrets/wp_user_pass.txt
	@echo "MADB_PASSWORD=root" > ./secrets/maria_password.txt
	@echo "MADB_ROOT_PASSWORD=changeitlater" > ./secrets/maria_password.txt
	@echo "WP_ADMIN_PASS=changeitlater" > ./secrets/wp_user_pass.txt
	@echo "WP_USERPWD=changeitlater" >> ./secrets/wp_user_pass.txt
	@echo "Secret files created successfully"

status:
	@docker ps
