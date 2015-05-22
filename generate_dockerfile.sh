#!/bin/bash
# re-generate Dockerfile for requested distribution(s)

dists=( ubuntu debian )
releases=( jessie trusty utopic wheezy )
versions=( 1.15.1 1.15.2 1.15.3 1.16.0 1.16.1 1.16.2 1.16.3 2.0.0 2.0.1 2.0.2 )

DOCKERFILE_TEMPLATE=Dockerfile.tpl

for dist in ${dists[@]}; do
  test -d $dist || mkdir $dist
  for release in ${releases[@]}; do
    test -d $dist/$release || mkdir $dist/$release
    for version in ${versions[@]}; do
      test -d $dist/$release/$version || mkdir $dist/$release/$version
      sed "/^ENV RETHINKDB_PACKAGE_VERSION/s/%version%/${version}/g;
           /^FROM/s/%dist%/${dist}/g;
           s/%release%/${release}/g" $DOCKERFILE_TEMPLATE > $dist/$release/$version/Dockerfile
      cp ./docker-entrypoint.sh $dist/$release/$version/
    done
  done
done
