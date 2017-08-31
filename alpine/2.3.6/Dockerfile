# Only alpine version that suports rethinkdb is edge
FROM alpine:edge

ENV RETHINKDB_VERSION 2.3.6-r1

RUN apk add --no-cache \
    rethinkdb=$RETHINKDB_VERSION

VOLUME ["/data"]

WORKDIR /data

EXPOSE 28015 29015 8080

CMD ["rethinkdb", "--bind", "all"]
