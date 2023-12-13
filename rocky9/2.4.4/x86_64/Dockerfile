FROM rockylinux:9

ENV RETHINKDB_PACKAGE_VERSION 2.4.4

RUN echo $'[rethinkdb]\n\
name=RethinkDB\n\
enabled=1\n\
baseurl=https://download.rethinkdb.com/repository/rocky/9/x86_64/\n\
gpgkey=https://download.rethinkdb.com/repository/raw/pubkey.gpg\n\
gpgcheck=1\n' >> /etc/yum.repos.d/rethinkdb.repo

RUN yum install -y rethinkdb-$RETHINKDB_PACKAGE_VERSION \
	&& yum clean all

VOLUME ["/data"]

WORKDIR /data

CMD ["rethinkdb", "--bind", "all"]

# process cluster webui
EXPOSE 28015 29015 8080
