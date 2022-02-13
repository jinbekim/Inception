FROM debian:buster

RUN apt-get update && apt-get install -y\
	mariadb-server\
	procps\
	&& rm -rf /var/lib/apt/lists/*

RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf


# TODO : use sql file
# RUN echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PW';GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PW';FLUSH PRIVILEGES;" > /tmp/setup.sql
# RUN service mysql start &&\
# 	mysql < /tmp/setup.sql &&\
# 	rm -rf /tmp/setup.sql &&\
# 	chown -R mysql:mysql /var/lib/mysql

COPY ./tools/init.sh ./

EXPOSE 3306

ENTRYPOINT [ "/bin/bash" ]
CMD [ "init.sh" ]

# ENTRYPOINT [ "mysqld_safe" ]
