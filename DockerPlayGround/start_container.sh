#!/bin/bash

docker run --rm -it --privileged \
    -v ./workspace:/workspace \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -e DISPLAY=$DISPLAY \
    -p 18570:18570/udp trick:19.7.3