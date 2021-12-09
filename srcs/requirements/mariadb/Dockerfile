FROM debian:buster

RUN apt update && apt install -y\
	mariadb-server\
	&& rm -rf /var/lib/apt/lists/*

COPY ./tools/init.sh ./

EXPOSE 3306

ENTRYPOINT [ "bash", "/init.sh" ]
