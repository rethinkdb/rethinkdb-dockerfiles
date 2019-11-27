FROM ubuntu:eoan

MAINTAINER Gabor Boros <gabor.brs@gmail.com>
ENV RETHINKDB_PACKAGE_VERSION 2.3.7~0eoan


RUN apt -qqy update \
    && apt install -y --no-install-recommends ca-certificates gnupg2 \
    && rm -rf /var/lib/apt/lists/*

RUN apt-key adv --fetch-keys https://download.rethinkdb.com/apt/pubkey.gpg \
    && echo "deb http://download.rethinkdb.com/apt eoan main" > /etc/apt/sources.list.d/rethinkdb.list

RUN apt -qqy update \
	&& apt install -y rethinkdb=$RETHINKDB_PACKAGE_VERSION \
	&& rm -rf /var/lib/apt/lists/*

VOLUME ["/data"]

WORKDIR /data

CMD ["rethinkdb", "--bind", "all"]

#   process cluster webui
EXPOSE 28015 29015 8080
