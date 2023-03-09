#!/bin/bash

[ -d data ] || mkdir -p data
[ -d home-kicad ] || mkdir -p home-kicad

HKA=/home/kicad
DDA=/data

IMAGE=kicli
NAME=kicli
docker kill $NAME
docker run -it --rm \
    --name $NAME \
    --hostname $NAME \
    -v $HOME/kicad-test-data:/kicad-data \
    -v $PWD/data:/kicad-scripts \
    -v $PWD/home-kicad:$HKA \
    --entrypoint /usr/bin/python3 \
    $IMAGE \
    /kicad-scripts/gen_gerber_and_drill_files_board.py /kicad-data/test/test.kicad_pcb
