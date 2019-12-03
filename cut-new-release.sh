#! /usr/bin/env bash

BASE_VERSION=2.3.6
NEW_VERSION=$1
SUFFIX=$2

# NOTE: Xenial and CentOS 7 are disabled until we upload 2.3.7
# packages for them to downloads.rethinkdb.com
# DISTROS="xenial bionic disco eoan centos7 centos8"
DISTROS="bionic disco eoan centos8"

function bootstrap_and_build {
  for DISTRO in $DISTROS; do
    if [ -d "$DISTRO/$NEW_VERSION" ]; then 
      echo "$DISTRO/$NEW_VERSION already exists... Skipping Dockerfile bootstrap"
    elif [ -f "$DISTRO/$BASE_VERSION/Dockerfile" ]; then
      mkdir "./$DISTRO/$NEW_VERSION"
      sed -e "s/$BASE_VERSION/$NEW_VERSION$SUFFIX/" "./$DISTRO/$BASE_VERSION/Dockerfile" \
        >"./$DISTRO/$NEW_VERSION/Dockerfile"
    fi

    docker build --no-cache -t rethinkdb:$DISTRO-$NEW_VERSION$SUFFIX $DISTRO/$NEW_VERSION$SUFFIX
  done
}

function commit_and_tag {
  git add ./*/"$NEW_VERSION"
  git commit -m "Add $NEW_VERSION"
  git tag "$NEW_VERSION" -m "$NEW_VERSION"
}

if [[ -z "$1" ]]; then
  echo "cut-NEW_VERSION-release: tag not specified" >&2
  exit 1
fi

bootstrap_and_build;
commit_and_tag;