FROM ubuntu:trusty

MAINTAINER Stuart P. Bentley <stuart@testtrack4.com>

ADD http://download.rethinkdb.com/apt/pubkey.gpg /temp/pubkey.gpg

ENV RETHINKDB_PACKAGE_VERSION 1.14.0-0ubuntu1~trusty

# Add the RethinkDB repository and public key
RUN echo "deb http://download.rethinkdb.com/apt `lsb_release -cs` main" > /etc/apt/sources.list.d/rethinkdb.list
RUN apt-key add /temp/pubkey.gpg && rm /temp/pubkey.gpg
RUN apt-get update
RUN apt-get install -y rethinkdb=$RETHINKDB_PACKAGE_VERSION

# Remove package lists for size
RUN rm -rf /var/lib/apt/lists/*

VOLUME ["/data"]

WORKDIR /data

CMD ["rethinkdb", "--bind", "all"]

EXPOSE 28015
EXPOSE 8080 # web UI
EXPOSE 29015 # cluster