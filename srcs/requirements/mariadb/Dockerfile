FROM debian:stable

RUN apt-get -y update 
#cli maridb
RUN apt-get -y install -y mariadb-client 
RUN apt-get -y install -y  mariadb-server 
#maridb_server pid file  
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld && chmod 777 /run/mysqld && chmod 777  /var/lib/mysql
COPY tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 644  /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/script.sh /usr/local/bin/script.sh
RUN chmod +x  /usr/local/bin/script.sh
EXPOSE 3306

ENTRYPOINT ["bash" , "/usr/local/bin/script.sh"]
CMD [ "mariadbd" , "--user=root" ]