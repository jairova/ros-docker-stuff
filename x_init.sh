#!/bin/bash

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run -it \
       --volume=$XSOCK:$XSOCK:rw \
       --volume=$XAUTH:$XAUTH:rw \
       --env="XAUTHORITY=${XAUTH}" \
       --env="DISPLAY" \
       --user="jairo" \
       --name ros_gui \
       ros-gui

