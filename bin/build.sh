#!/bin/bash -e
set -o pipefail

CONTAINER_NAME="nginx"

docker build -t ${CONTAINER_NAME} .
