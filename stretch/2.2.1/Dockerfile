FROM debian:stretch-slim

MAINTAINER Daniel Alan Miller <dalanmiller@rethinkdb.com>

# Add the RethinkDB repository and public key
# "RethinkDB Packaging <packaging@rethinkdb.com>" https://download.rethinkdb.com/repository/raw/pubkey.gpg
RUN apt-key adv --keyserver pgp.mit.edu --recv-keys "539A3A8C6692E6E3F69B3FE81D85E93F801BB43F"
RUN echo "deb https://download.rethinkdb.com/repository/debian-stretch stretch main" > /etc/apt/sources.list.d/rethinkdb.list

ENV RETHINKDB_PACKAGE_VERSION 2.2.1~0stretch

RUN apt-get update \
	&& apt-get install -y rethinkdb=$RETHINKDB_PACKAGE_VERSION \
	&& rm -rf /var/lib/apt/lists/*

VOLUME ["/data"]

WORKDIR /data

CMD ["rethinkdb", "--bind", "all"]

#   process cluster webui
EXPOSE 28015 29015 8080
