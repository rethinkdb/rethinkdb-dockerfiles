FROM       alpine:3.8
LABEL      mantainer="Daniel Alan Miller <dalanmiller@rethinkdb.com>"
ENV        RETHINKDB_PACKAGE_VERSION=2.3.6-r6
RUN        apk add --no-cache \
               jq \
               rethinkdb=$RETHINKDB_PACKAGE_VERSION
VOLUME     ["/data"]
WORKDIR    /data
CMD        ["rethinkdb", "--bind", "all"]
EXPOSE     28015 29015 8080
