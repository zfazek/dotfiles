#!/bin/bash

export uid=$(id -u)
export gid=$(id -g)

docker run \
    --interactive \
    --tty \
    --hostname docker \
    --user $uid:$gid \
    --workdir="/home/$USER" \
    --volume="$HOME:$HOME" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    ubuntu:latest /bin/bash
