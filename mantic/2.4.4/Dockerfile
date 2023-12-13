FROM ubuntu:mantic

RUN apt-get -qqy update \
    && apt-get install -y --no-install-recommends curl ca-certificates gnupg2 \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://download.rethinkdb.com/repository/raw/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/rethinkdb.gpg | gpg --armor \
    && echo "deb [signed-by=/usr/share/keyrings/rethinkdb.gpg] https://download.rethinkdb.com/repository/ubuntu-mantic mantic main" > /etc/apt/sources.list.d/rethinkdb.list

ENV RETHINKDB_PACKAGE_VERSION 2.4.4~0mantic

RUN apt-get -qqy update \
	&& apt-get install -y rethinkdb=$RETHINKDB_PACKAGE_VERSION \
	&& rm -rf /var/lib/apt/lists/*

VOLUME ["/data"]

WORKDIR /data

CMD ["rethinkdb", "--bind", "all"]

#   process cluster webui
EXPOSE 28015 29015 8080

