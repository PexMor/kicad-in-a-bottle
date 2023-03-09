#!/bin/bash

[ -d data ] || mkdir -p data
[ -d home-kicad ] || mkdir -p home-kicad

if [ ! -f home-kicad/.xsession ]; then
    echo "xfce4-session" >home-kicad/.Xsession
fi

N=kirdp
IMAGE=kirdp
docker kill $N
docker run -it --rm \
    --name $N \
    --hostname="$(hostname)" \
    --shm-size="1g" \
    --security-opt seccomp=unconfined \
    -v $HOME/kicad-test-data:/kicad-data \
    -v $PWD/data:/kicad-scripts \
    -p 5901:5900 \
    -p 3390:3389 \
    $IMAGE \
    "$@"
