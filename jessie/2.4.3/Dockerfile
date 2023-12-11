FROM debian:jessie-slim

RUN apt-get -qqy update \
    && apt-get install -y --no-install-recommends apt-transport-https ca-certificates gnupg2 \
    && rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver pgp.mit.edu --recv-keys "539A3A8C6692E6E3F69B3FE81D85E93F801BB43F" \
    && echo "deb https://download.rethinkdb.com/repository/debian-jessie jessie main" > /etc/apt/sources.list.d/rethinkdb.list

ENV RETHINKDB_PACKAGE_VERSION 2.4.3~0jessie

RUN apt-get -qqy update \
	&& apt-get install -y rethinkdb=$RETHINKDB_PACKAGE_VERSION \
	&& rm -rf /var/lib/apt/lists/*

VOLUME ["/data"]

WORKDIR /data

CMD ["rethinkdb", "--bind", "all"]

#   process cluster webui
EXPOSE 28015 29015 8080

