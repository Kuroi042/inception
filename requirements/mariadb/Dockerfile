FROM debian:bookworm

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y mariadb-server vim mariadb-client 
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld && chmod 777 /run/mysqld
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 644  /etc/mysql/mariadb.conf.d/50-server.cnf
COPY script.sh /usr/local/bin/script.sh
RUN chmod +x  /usr/local/bin/script.sh
EXPOSE 3306

ENTRYPOINT ["bash" , "/usr/local/bin/script.sh"]
CMD [ "mariadbd" , "--user=root" , "--bind-address=0.0.0.0" , "--verbose" ]