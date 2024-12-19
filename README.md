

  	''creat secret
	@touch ./secrets/maria_password.txt
	@touch ./secrets/wp_user_pass.txt
	@echo "MADB_PASSWORD=root" > ./secrets/maria_password.txt
	@echo "MADB_ROOT_PASSWORD=changeitlater" > ./secrets/maria_password.txt
	@echo "WP_ADMIN_PASS=changeitlater" > ./secrets/wp_user_pass.txt
	@echo "WP_USERPWD=changeitlater" >> ./secrets/wp_user_pass.txt
  
  	''Create environment file
	echo "DOMAIN_NAME=mbouderr.42.fr" > ./srcs/.env
	echo "MADB_NAME=inceptiondb" >> ./srcs/.env
	echo "MADB_HOST=mariadb:3306" >> ./srcs/.env
	echo "WP_USER=charaf" >> ./srcs/.env
	echo "WP_TITLE=my wordpress page" >> ./srcs/.env
	echo "WP_ADMIN_EMAIL=charaf@gmail.com" >> ./srcs/.env
	echo "WP_EDMIN_USER=superuser" >> ./srcs/.env
	echo "WP_AMAIL=user@gmail.com" >> ./srcs/.env
