#!/bin/bash

export DOCKER_BUILDKIT=1

#: ${DOCKER_NO_CACHE:=--no-cache}
: ${DOCKER_NO_CACHE:=}
export DOCKER_NO_CACHE

docker build $DOCKER_NO_CACHE -t u2004rdp \
    --progress=plain \
    -f Dockerfile.rdp \
    . 2>&1 | tee tmp-build-u2004rdp.log
