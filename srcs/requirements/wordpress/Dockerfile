FROM debian:buster

RUN apt-get update && apt-get install -y \
	php7.3-fpm\
	mariadb-client\
	&& rm -rf /var/lib/apt/lists/*

COPY ./tools/wordpress/ /var/www/html

RUN chown -R www-data:www-data /var/www/html
RUN sed -i 's/\/run\/php\/php7.3-fpm.sock/0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf &&\
	service php7.3-fpm start

EXPOSE 9000

ENTRYPOINT [ "php-fpm7.3" ]
CMD [ "--nodaemonize" ]
