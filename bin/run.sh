#!/bin/bash -e
set -o pipefail

. bin/build.sh

HOSTNAME=${CONTAINER_NAME}
RESTART="unless-stopped"

docker stop ${CONTAINER_NAME} || true

docker rm ${CONTAINER_NAME} || true

docker network create --driver bridge web || true

docker run -d -v $(pwd)/confs/html:/usr/share/nginx/html -v $(pwd)/confs/default.conf:/etc/nginx/conf.d/default.conf  -p80:80  --network=web --name=${CONTAINER_NAME} --hostname ${HOSTNAME} --restart ${RESTART} ${CONTAINER_NAME}
