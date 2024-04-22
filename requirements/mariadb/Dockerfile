#Dockerfile for mariadb database
FROM debian:stable

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y mariadb-server vim

# Change ownership and permissions of the Unix socket directory
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld && chmod 777 /run/mysqld
EXPOSE 3306
#RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
# COPY script.sh /usr/local/bin/
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 777 /etc/mysql/mariadb.conf.d/50-server.cnf
# Make the scripts executable
COPY script.sh /usr/local/bin/script.sh
RUN chmod +x  /usr/local/bin/script.sh

# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/script.sh"]
CMD mysqld --user=mysql
