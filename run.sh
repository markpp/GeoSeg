#!/bin/bash
xhost +local:
docker run -t -it --net=host \
  --gpus all \
  --volume=/dev:/dev \
  --name=dockerpytorch \
  --workdir=/code \
  -e DISPLAY=$DISPLAY \
  -e XAUTHORITY \
  -e NVIDIA_DRIVER_CAPABILITIES=all \
  -e QT_GRAPHICSSYSTEM=native \
  -e CONTAINER_NAME=dockerpytorch-dev \
  -v "/tmp/.X11-unix:/tmp/.X11-unix" \
  dockerpytorch:latest
