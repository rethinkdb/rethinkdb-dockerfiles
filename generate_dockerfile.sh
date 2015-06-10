#!/bin/bash
# re-generate Dockerfile for requested distribution(s)

dists=( ubuntu:trusty ubuntu:utopic debian:wheezy debian:jessie )
versions=( 1.15.1 1.15.2 1.15.3 1.16.0 1.16.1 1.16.2 1.16.3 2.0.0 2.0.1 2.0.2 )

DOCKERFILE_TEMPLATE=Dockerfile.tpl

for dist in ${dists[@]}; do
  vendor=${dist%:*}
  release=${dist#*:}
  test -d $vendor || mkdir $vendor
  test -d $vendor/$release || mkdir $vendor/$release
  for version in ${versions[@]}; do
    test -d $vendor/$release/$version || mkdir $vendor/$release/$version
    sed "/^ENV RETHINKDB_PACKAGE_VERSION/s/%version%/${version}/g;
         /^FROM/s/%dist%/${vendor}/g;
         s/%release%/${release}/g" $DOCKERFILE_TEMPLATE > $vendor/$release/$version/Dockerfile
    cp ./docker-entrypoint.sh $vendor/$release/$version/
  done
done
