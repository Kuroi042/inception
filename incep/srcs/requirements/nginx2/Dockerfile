FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade


# Install Nginx
RUN apt-get install -y nano
RUN apt-get  install -y nginx 
COPY /ssl/server.key /etc/nginx/ssl/
COPY /ssl/server.crt /etc/nginx/ssl/
COPY  nginx.conf /etc/nginx/
EXPOSE 443
RUN chmod  777 /var/www/html/*
CMD ["nginx", "-g", "daemon off;"]
                                    