#!/bin/bash

export DOCKER_BUILDKIT=1
#: ${DOCKER_NO_CACHE:=--no-cache}
: ${DOCKER_NO_CACHE:=}
export DOCKER_NO_CACHE

docker build $DOCKER_NO_CACHE -t u2004kicad \
    --progress=plain \
    -f Dockerfile.kicad_gui \
    . 2>&1 | tee tmp-build-u2004kicad.log
