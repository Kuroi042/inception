all : env up 


clean  :
	@sudo docker system prune -af

up :env 
	@mkdir -p /home/mbouderr/data/mariadb
	@mkdir -p /home/mbouderr/data/wordpress
	@echo "volume created !! "
	@docker-compose -f ./srcs/docker-compose.yml up --build  -d

down :
	@docker-compose -f ./srcs/docker-compose.yml down -v
	@echo "deleting volume"
	@sudo rm -rf /home/mbouderr/data/*
	@echo "volumes deleted"
	@sudo rm -rf ./srcs/.env
	@echo "env deleted"

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

env :
	touch ./srcs/.env
	@echo "DOMAIN_NAME=mbouderr.42.fr" > ./srcs/.env
	@echo "MADB_NAME=charaf" >> ./srcs/.env
	@echo "MADB_HOST=mariadb:3306" >> ./srcs/.env
	@echo "WP_USER=kenshin" >> ./srcs/.env
	@echo "WP_PWD=modopass" >> ./srcs/.env
	@echo "WP_TITLE=Med_charaf_eddin_chihab_Jesus_Bouderraoui " >> ./srcs/.env
	@echo "WP_ADMIN_USER=jesus" >> ./srcs/.env
	@echo "WP_ADMIN_EMAIL=huhu42548full2@simolive.gov" >> ./srcs/.env
	@echo "WP_EMAIL=xxjhonnysins@1234.com" >> ./srcs/.env
	echo "enviremient is created successfully"

status : 
	@docker ps
