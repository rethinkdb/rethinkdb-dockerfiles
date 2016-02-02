#! /usr/bin/env bash

base=2.0.1
new=$1
suffix=$2

if [[ -z "$1" ]]; then
  echo "cut-new-release: tag not specified" >&2
  exit 1
fi

for distro in jessie trusty utopic wheezy vivid; do
  mkdir "./$distro/$new"
  sed -e "s/$base/$new$suffix/" "./$distro/$base/Dockerfile" \
    >"./$distro/$new/Dockerfile"
done
git add ./*/"$new"
git commit -m "Add $new"
git tag "$new" -m "$new"
