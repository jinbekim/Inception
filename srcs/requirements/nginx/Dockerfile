FROM debian:buster

RUN apt update && apt install -y\
	nginx\
	openssl\
	&& rm -rf /var/lib/apt/lists/*

# copy a self-signed certificate
COPY ./tools/inception.crt etc/ssl/certs/
COPY ./tools/inception.key etc/ssl/private/

# copy nginx configuration
COPY ./conf/setting /etc/nginx/sites-enabled/setting

EXPOSE 443

# run nginx forground
ENTRYPOINT [ "nginx" ]
CMD [ "-g", "daemon off;" ]
