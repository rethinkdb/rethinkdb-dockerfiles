FROM debian:jessie-slim

MAINTAINER Daniel Alan Miller <dalanmiller@rethinkdb.com>

# Add the RethinkDB repository and public key
# "RethinkDB Packaging <packaging@rethinkdb.com>" https://download.rethinkdb.com/repository/raw/pubkey.gpg
RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 3B87619DF812A63A8C1005C30742918E5C8DA04A
RUN echo "deb https://download.rethinkdb.com/repository/debian-jessie jessie main" > /etc/apt/sources.list.d/rethinkdb.list

ENV RETHINKDB_PACKAGE_VERSION 2.3.6~0jessie

RUN apt-get update \
	&& apt-get install -y rethinkdb=$RETHINKDB_PACKAGE_VERSION \
	&& rm -rf /var/lib/apt/lists/*

VOLUME ["/data"]

WORKDIR /data

CMD ["rethinkdb", "--bind", "all"]

#   process cluster webui
EXPOSE 28015 29015 8080
