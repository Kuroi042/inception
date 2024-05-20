FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade


# Install Nginx
RUN apt-get install -y nano
RUN apt-get  install -y nginx 
COPY tools/ssl/server.key /etc/nginx/ssl/
COPY tools/ssl/server.crt /etc/nginx/ssl/
COPY  tools/nginx.conf /etc/nginx/
EXPOSE 443
#make nginx service in foreground 
CMD ["nginx", "-g", "daemon off;"]
                                    