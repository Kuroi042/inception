FROM debian:bullseye
RUN apt-get -y update  && apt-get -y  upgrade
RUN  apt-get install -y openssl nginx
RUN apt-get install -y  systemctl
RUN apt-get install net-tools
RUN apt-get install -y nano
#RUN mkdir -p /etc/ssl/certs /etc/ssl/private
#RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
 #   -keyout /etc/ssl/private/nginx-selfsigned.key \
  #  -out /etc/ssl/certs/nginx-selfsigned.crt \
   # -subj "/C=US/ST=California/L=San Francisco/O=My Organization/OU=My Unit/CN=mydomain.com"

RUN rm /etc/nginx/sites-enabled/default
#COPY nginx.conf /etc/nginx/nginx.conf
COPY /tools/  /var/www/html
COPY default  /etc/nginx/sites-enabled/
EXPOSE 443
CMD ["nginx","-g", "daemon off;"]
