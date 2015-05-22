FROM ubuntu:wheezy

MAINTAINER Stuart P. Bentley <stuart@testtrack4.com>

# Add the RethinkDB repository and public key
# "RethinkDB Packaging <packaging@rethinkdb.com>" http://download.rethinkdb.com/apt/pubkey.gpg
RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 1614552E5765227AEC39EFCFA7E00EF33A8F2399
RUN echo "deb http://download.rethinkdb.com/apt wheezy main" > /etc/apt/sources.list.d/rethinkdb.list

ENV RETHINKDB_PACKAGE_VERSION 1.16.2

RUN apt-get update \
	&& apt-get install -y rethinkdb=$RETHINKDB_PACKAGE_VERSION* \
	&& apt-get install -y --no-install-recommends bind9-host    \
	&& rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /entrypoint.sh

VOLUME ["/data"]

WORKDIR /data

ENTRYPOINT ["/entrypoint.sh"]

CMD ["--bind","all"]

#   process cluster webui
EXPOSE 28015 29015 8080
