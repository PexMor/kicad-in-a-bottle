#!/bin/bash

export DOCKER_BUILDKIT=1

docker build -t kitest --progress=plain . 2>&1 | tee tmp-build.log
