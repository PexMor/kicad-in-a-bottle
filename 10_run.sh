#!/bin/bash

[ -d data ] || mkdir -p data
[ -d home-kicad ] || mkdir -p home-kicad

docker kill kitest
docker run -it --rm \
    --name kitest \
    --hostname kitest \
    -v $PWD/runx.sh:/usr/local/bin/runx.sh \
    -v $PWD/data:/data \
    -v $PWD/home-kicad:/home/kicad \
    -p 5901:5900 \
    kitest