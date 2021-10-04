#!/usr/bin/env sh

#
# Slim end to end test

_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd $_DIR/..
docker build -t local/arch-me -f Dockerfile .
docker run --rm -it local/arch-me
