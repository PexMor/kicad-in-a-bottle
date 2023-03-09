#!/bin/bash

[ -d data ] || mkdir -p data
[ -d home-kicad ] || mkdir -p home-kicad

if [ ! -f home-kicad/.xsession ]; then
    echo "xfce4-session" >home-kicad/.Xsession
fi

NAME=rdp
IMAGE=u2004rdp
docker kill $NAME
docker run -it --rm \
    --name $NAME \
    --hostname="$(hostname)" \
    --shm-size="1g" \
    --security-opt seccomp=unconfined \
    -v $HOME/kicad-test-data:/kicad-data \
    -v $PWD/data:/kicad-scripts \
    -v $PWD/home-kicad:/home/kicad \
    -p 5901:5900 \
    -p 3390:3389 \
    $IMAGE \
    "$@"
