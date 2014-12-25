FROM ubuntu:trusty

MAINTAINER Stuart P. Bentley <stuart@testtrack4.com>

ADD http://download.rethinkdb.com/apt/pubkey.gpg /temp/pubkey.gpg

ENV RETHINKDB_PACKAGE_VERSION 1.15.0-1-0ubuntu1~trusty

# Add the RethinkDB repository and public key
RUN echo "deb http://download.rethinkdb.com/apt trusty main" > /etc/apt/sources.list.d/rethinkdb.list
RUN apt-key add /temp/pubkey.gpg && rm /temp/pubkey.gpg
RUN apt-get update && apt-get install -y rethinkdb=$RETHINKDB_PACKAGE_VERSION

# Remove package lists for size
RUN rm -rf /var/lib/apt/lists/*

VOLUME ["/data"]

WORKDIR /data

CMD ["rethinkdb", "--bind", "all"]

# process
EXPOSE 28015
# web UI
EXPOSE 8080
# cluster
EXPOSE 29015
