#!/bin/bash

[ -d data ] || mkdir -p data
[ -d home-kicad ] || mkdir -p home-kicad

HKA=/home/kicad
DDA=/data

docker kill kitest
docker run -it --rm \
    --name kipy \
    --hostname kipy \
    -v $PWD/runx.sh:/usr/local/bin/runx.sh \
    -v $PWD/data:/data \
    -v $PWD/home-kicad:$HKA \
    -p 5901:5900 \
    --entrypoint /usr/bin/python3 \
    kitest \
    $DDA/gen_gerber_and_drill_files_board.py $HKA/test/test.kicad_pcb
