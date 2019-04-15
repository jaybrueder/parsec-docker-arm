#!/bin/bash
set -e

if [[ -n "$(docker ps -qaf 'name=parsec-docker')" ]]; then
    docker restart parsec-docker
else
    USER_UID=$(id -u)
    USER_GID=$(id -g)

    docker run --rm --name parsec-docker \
        -e USER_UID=${USER_UID} \
        -e USER_GID=${USER_GID} \
        -e DISPLAY=unix${DISPLAY} \
        -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
        -v /run/user/${USER_UID}/pulse:/run/pulse:ro \
        --mount source=parsec_home,target=/home/parsec \
        --device=/dev/dri \
        jaybrueder/parsec-docker
fi
