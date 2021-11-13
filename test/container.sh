#!/usr/bin/env bash

#
# Slim end to end test

CONFIGURATION=${1:-local}
echo "Configuration : ${CONFIGURATION}"

_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd $_DIR/..
docker build -t local/arch-me:${CONFIGURATION} \
  --build-arg CONFIGURATION=${CONFIGURATION} -f Dockerfile .
if [ $? -ne 0 ] ; then
  echo "Docker build failed"
  exit 1
fi
docker run --rm -it local/arch-me:${CONFIGURATION}
