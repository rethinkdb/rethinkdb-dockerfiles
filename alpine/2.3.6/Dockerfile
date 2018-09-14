FROM       alpine
LABEL      mantainer="Slava Kalashnikov <xemuliam@gmail.com>"
ARG        RETHINKDB_PACKAGE_VERSION=2.3.6-r6
RUN        apk add --no-cache \
               jq \
               rethinkdb=$RETHINKDB_VERSION
EXPOSE     28015 29015 8080
VOLUME     /data
WORKDIR    /data
CMD       rethinkdb --bind all
