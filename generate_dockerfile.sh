#!/bin/bash
# re-generate Dockerfile for requested distribution(s)

dists=( jessie trusty utopic wheezy )
versions=( 1.15.1 1.15.2 1.15.3 1.16.0 1.16.1 1.16.2 1.16.3 2.0.0 2.0.1 2.0.2 )

[ -n "$1" ] && dists=( $1 )

for dist in ${dists[@]}; do
  test -d $dist || mkdir $dist
  for version in ${versions[@]}; do
    test -d $dist/$version || mkdir $dist/$version
    sed "/^ENV RETHINKDB_PACKAGE_VERSION/s/%version%/${version}/g" $dist/Dockerfile > $dist/$version/Dockerfile
    cp ./docker-entrypoint.sh $dist/$version/
  done
done
