FROM debian:bullseye-slim

RUN apt-get -qqy update \
    && apt-get install -y --no-install-recommends ca-certificates gnupg2 curl \
    && rm -rf /var/lib/apt/lists/*

RUN GNUPGHOME="$(mktemp -d)" && export GNUPGHOME \
    && gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys 539A3A8C6692E6E3F69B3FE81D85E93F801BB43F \
    && gpg --batch --export 539A3A8C6692E6E3F69B3FE81D85E93F801BB43F > /usr/share/keyrings/rethinkdb.gpg \
    && gpgconf --kill all && rm -rf "$GNUPGHOME" \
    && echo "deb [signed-by=/usr/share/keyrings/rethinkdb.gpg] https://download.rethinkdb.com/repository/debian-bullseye bullseye main" > /etc/apt/sources.list.d/rethinkdb.list

ENV RETHINKDB_PACKAGE_VERSION 2.4.2~0bullseye

RUN apt-get -qqy update \
	&& apt-get install -y rethinkdb=$RETHINKDB_PACKAGE_VERSION \
	&& rm -rf /var/lib/apt/lists/*

VOLUME ["/data"]

WORKDIR /data

CMD ["rethinkdb", "--bind", "all"]

#   process cluster webui
EXPOSE 28015 29015 8080

