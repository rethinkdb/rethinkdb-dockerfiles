#!/bin/bash
set -e

TUTUM_ARGS=()

if [ "${1:0:1}" = '-' ]; then
  [ -n "$TUTUM_CONTAINER_FQDN" ] && TUTUM_ARGS+=( --canonical-address $TUTUM_CONTAINER_FQDN )
  [ -n "$TUTUM_IP_ADDRESS" ] && TUTUM_ARGS+=( --canonical-address $TUTUM_IP_ADDRESS )
  [ -n "$TUTUM_SERVICE_FQDN" ] && TUTUM_ARGS+=( --join $TUTUM_SERVICE_FQDN )
  set -- rethinkdb "$@" "${TUTUM_ARGS[@]}"
fi

exec "$@"
