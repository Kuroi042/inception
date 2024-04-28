FROM debian:buster
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y nano
RUN apt-get install -y apt-utils
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN apt-get install -y php7.3\
   php-fpm\
   php-mysql\
   mariadb-client
RUN wget https://wordpress.org/latest.tar.gz -P /var/www
RUN cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz
RUN      chown -R root:root /var/www/wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && mv /wp-cli.phar /bin/wp && chmod +x /bin/wp
COPY www.conf /etc/php/7.3/fpm/pool.d/
RUN chmod 777 /etc/php/7.3/fpm/pool.d/www.conf
# RUN mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
COPY script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/script.sh
# RUN ./usr/local/bin/script.sh
ENTRYPOINT ["/usr/local/bin/script.sh"]
RUN chown -R www-data:www-data /var/www/wordpress
RUN chmod -R 755 /var/www/wordpress
RUN mkdir /run/php
RUN chmod 777 /run/php
WORKDIR /var/www/wordpress/
EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]