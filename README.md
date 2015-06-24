# rethinkdb-dockerfiles

Dockerfiles for past and present versions of RethinkDB.

[![Docker Hub](https://img.shields.io/badge/docker-ready-blue.svg?style=flat-square)](https://registry.hub.docker.com/u/anapsix/rethinkdb/) 
[![](https://badge.imagelayers.io/anapsix/rethinkdb:latest.svg)](https://imagelayers.io/?images=anapsix/rethinkdb:latest)

## New

[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/)

Start script is now [Tutum](http://tutum.co) compatible.
All is needed to start a 2+ node cluster is do a one-to-one port mapping 
(8080->8080, 28015->28015, 29015->29015) and that's it.
All instances will auto-discover each other and join the cluster.
Go to service enpoint for port 8080 to access web UI.

## Documentation

https://github.com/docker-library/docs/blob/master/rethinkdb/README.md

## Procedure for updating

This is mostly a checklist for my own personal use.

1. Realize RethinkDB has updated. *This part needs improving.*
2. Go to https://ide.c9.io/stuartpb/rethinkdb-dockerfiles and open a terminal.
2. Look up what the new package names are by going to
   http://download.rethinkdb.com/apt/pool/jessie/main/r/rethinkdb/ and
   http://download.rethinkdb.com/apt/pool/trusty/main/r/rethinkdb/ etc.
3. Run `./cut-new-release.sh` for each missing release:

   ```bash
   ./cut-new-release.sh 1.16.1
   ./cut-new-release.sh 1.16.2 +1
   # etc...
   ```

4. Commit this, push it to GitHub, and note the hash.
5. Go to https://github.com/docker-library/official-images/edit/master/library/rethinkdb
   and put together a pull request that includes all the new tags from jessie.
6. Wait for that pull request to be approved.
7. Open up https://ide.c9.io/stuartpb/plushu and update
   `services/rethinkdb/docker/DEFAULT_IMAGE`. Git commit and push.
8. Update on any server I care about having the latest RDB on.
