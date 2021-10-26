FROM ubuntu:xenial

RUN apt-get update -qqy \
    && apt-get install -y --no-install-recommends apt-transport-https ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1D85E93F801BB43F \
    && echo "deb https://download.rethinkdb.com/repository/ubuntu-xenial xenial main" > /etc/apt/sources.list.d/rethinkdb.list

ENV RETHINKDB_PACKAGE_VERSION 2.3.6~0xenial

RUN apt-get update -qq \
	&& apt-get install -y rethinkdb=$RETHINKDB_PACKAGE_VERSION \
	&& rm -rf /var/lib/apt/lists/*

VOLUME ["/data"]

WORKDIR /data

CMD ["rethinkdb", "--bind", "all"]

#   process cluster webui
EXPOSE 28015 29015 8080
