#!/bin/bash

export DOCKER_BUILDKIT=1
#: ${DOCKER_NO_CACHE:=--no-cache}
: ${DOCKER_NO_CACHE:=}
export DOCKER_NO_CACHE

docker build $DOCKER_NO_CACHE -t kicli \
    -f Dockerfile.cli \
    --progress=plain \
    . 2>&1 | tee tmp-build-kicli.log
