#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

REPO=rakauchuk/nginx

cid="$(docker run -d ${REPO})"
trap "docker rm -vf ${cid} > /dev/null" EXIT

echo -n "Checking NGINX version... "
docker exec "${cid}" nginx -v 2>&1 | grep -q '1.13.8' # TODO: use ENV `TAG`
echo "OK"
