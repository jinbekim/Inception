FROM debian:buster

RUN apt-get update && apt-get upgrade && apt-get install -y \
	php7.3-fpm\
	mariadb-client\
	php7.3-mysql\
	wget\
	curl\
	&& rm -rf /var/lib/apt/lists/*

COPY ./conf/wp-config.php /tmp/wp-config.php
COPY ./tools/init.sh ./

RUN sed -i 's/\/run\/php\/php7.3-fpm.sock/0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf &&\
	service php7.3-fpm start

EXPOSE 9000

ENTRYPOINT [ "/bin/bash" ]
CMD [ "init.sh" ]
