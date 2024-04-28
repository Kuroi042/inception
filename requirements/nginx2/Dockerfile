# Start with the Debian base image

FROM debian:bullseye

# Update the package lists
RUN apt-get -y update && apt-get -y upgrade


# Install Nginx
RUN apt-get install -y nano
RUN apt-get  install -y nginx 
COPY /ssl/server.key /etc/nginx/ssl/
COPY /ssl/server.crt /etc/nginx/ssl/
COPY  nginx.conf /etc/nginx/
# Copy the index.html file to the Nginx default directory
# COPY /tools/ /var/www/html/

RUN chmod  777 /var/www/html/*

# Start Nginx and map port 8080 of the container to port 8080 of the host
CMD ["nginx", "-g", "daemon off;"]
                                    