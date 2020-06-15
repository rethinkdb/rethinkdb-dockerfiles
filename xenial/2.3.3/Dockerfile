FROM ubuntu:xenial

MAINTAINER Daniel Alan Miller <dalanmiller@rethinkdb.com>

# Add the RethinkDB repository and public key
# "RethinkDB Packaging <packaging@rethinkdb.com>" https://download.rethinkdb.com/repository/raw/pubkey.gpg
RUN apt-key adv --keyserver pgp.mit.edu --recv-keys "539A 3A8C 6692 E6E3 F69B 3FE8 1D85 E93F 801B B43F"
RUN echo "deb https://download.rethinkdb.com/repository/ubuntu-xenial xenial main" > /etc/apt/sources.list.d/rethinkdb.list

ENV RETHINKDB_PACKAGE_VERSION 2.3.3~0xenial

RUN apt-get update \
	&& apt-get install -y rethinkdb=$RETHINKDB_PACKAGE_VERSION \
	&& rm -rf /var/lib/apt/lists/*

VOLUME ["/data"]

WORKDIR /data

CMD ["rethinkdb", "--bind", "all"]

#   process cluster webui
EXPOSE 28015 29015 8080
