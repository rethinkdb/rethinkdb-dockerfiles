#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
  [ -n "$TUTUM_CONTAINER_FQDN" ] && TUTUM_ARGS+=( --canonical-address $TUTUM_CONTAINER_FQDN )
  [ -n "$TUTUM_IP_ADDRESS" ] && TUTUM_ARGS+=( --canonical-address ${TUTUM_IP_ADDRESS%/*} )
  if [ -n "$TUTUM_SERVICE_FQDN" ]; then
    for host in $(host -s -t a $TUTUM_SERVICE_FQDN | awk '{print $NF}'); do
      TUTUM_ARGS+=( --join $host )
    done
  fi
  [ -n "$TUTUM_ARGS" ] && TUTUM_ARGS+=( --bind all )
  set -- rethinkdb "$@" "${TUTUM_ARGS[@]}"
fi

exec "$@"
