#! /usr/bin/env bash

base=1.16.0
new=$1
suffix=$2

for distro in jessie trusty utopic wheezy; do
  cp -r "$distro/$base" "$distro/$new"
  sed -i "s/$base/$new$suffix/" "$distro/$new/Dockerfile"
done
