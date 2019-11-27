FROM ubuntu:xenial

MAINTAINER Gabor Boros <gabor.brs@gmail.com>
ENV RETHINKDB_PACKAGE_VERSION 2.3.6~0xenial


RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends \
        apt-transport-https ca-certificates curl gnupg-curl gnupg2 \
    && rm -rf /var/lib/apt/lists/*

RUN apt-key adv --fetch-keys https://download.rethinkdb.com/apt/pubkey.gpg \
    && echo "deb https://download.rethinkdb.com/apt xenial main" > /etc/apt/sources.list.d/rethinkdb.list

RUN apt-get update -qq \
	&& apt-get install -y rethinkdb=$RETHINKDB_PACKAGE_VERSION \
	&& rm -rf /var/lib/apt/lists/*

VOLUME ["/data"]

WORKDIR /data

CMD ["rethinkdb", "--bind", "all"]

#   process cluster webui
EXPOSE 28015 29015 8080
