#! /usr/bin/env bash

BASE_VERSION=2.4.4
NEW_VERSION=$1
SUFFIX=$2

# packages for them to downloads.rethinkdb.com
DISTROS="alma8 alma9 bionic bookworm bullseye buster centos7 focal hirsute impish jammy jessie lunar mantic rocky8 rocky9 stretch trusty xenial"

function bootstrap_and_build {
  for DISTRO in $DISTROS; do
    if [ -d "$DISTRO/$NEW_VERSION" ]; then
      echo "$DISTRO/$NEW_VERSION already exists... Skipping Dockerfile bootstrap"
    else
      # What's the point of $SUFFIX?  It doesn't do anything if
      # $DISTRO/$NEW_VERSION already exists!  Probably, that is a bug.
      # You might want to look at the file history.  Maybe it never
      # got used.

      if [ -f "$DISTRO/$BASE_VERSION/Dockerfile" ]; then
        mkdir "./$DISTRO/$NEW_VERSION"
        sed -e "s/$BASE_VERSION/$NEW_VERSION$SUFFIX/" "./$DISTRO/$BASE_VERSION/Dockerfile" > "./$DISTRO/$NEW_VERSION/Dockerfile"
        docker build --no-cache -t "rethinkdb:$DISTRO-$NEW_VERSION$SUFFIX" "$DISTRO/$NEW_VERSION"
      fi

      # RPM distros look like below:
      if [ -f "$DISTRO/$BASE_VERSION/aarch64/Dockerfile" ]; then
        mkdir -p "./$DISTRO/$NEW_VERSION/aarch64"
        sed -e "s/$BASE_VERSION/$NEW_VERSION$SUFFIX/" "./$DISTRO/$BASE_VERSION/aarch64/Dockerfile" > "./$DISTRO/$NEW_VERSION/aarch64/Dockerfile"
        # This is just for testing -- right now we ASSUME the developer is running x86_64.
        # docker build --no-cache -t "rethinkdb:$DISTRO-$NEW_VERSION$SUFFIX" "$DISTRO/$NEW_VERSION/aarch64"
      fi
      if [ -f "$DISTRO/$BASE_VERSION/x86_64/Dockerfile" ]; then
        mkdir -p "./$DISTRO/$NEW_VERSION/x86_64"
        sed -e "s/$BASE_VERSION/$NEW_VERSION$SUFFIX/" "./$DISTRO/$BASE_VERSION/x86_64/Dockerfile" > "./$DISTRO/$NEW_VERSION/x86_64/Dockerfile"
        docker build --no-cache -t "rethinkdb:$DISTRO-$NEW_VERSION$SUFFIX" "$DISTRO/$NEW_VERSION/x86_64"
      fi
    fi

  done
}

function commit_and_tag {
  git add ./*/"$NEW_VERSION"
  git commit -m "Add $NEW_VERSION"
  git tag "$NEW_VERSION" -m "$NEW_VERSION"
}

if [[ -z "$1" ]]; then
  echo "cut-new-release: tag not specified" >&2
  exit 1
fi

bootstrap_and_build;
commit_and_tag;
