#!/usr/bin/env bash

#
# Slim end to end test

_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd $_DIR/..
podman build -t local/arch-me -f Dockerfile .
# As per https://githubmemory.com/repo/containers/podman/issues/11837
# need to specify a port others it fails with podman. -p 8080 can be removed
# soon when that's fixed
podman run -p 8080 --rm -it local/arch-me
