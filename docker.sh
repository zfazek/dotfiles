#!/bin/bash

export UID=$(id -u)
export GID=$(id -g)

docker run \
    --interactive \
    --tty \
    --hostname docker \
    --user $UID:$GID \
    --workdir="/home/$USER" \
    --volume="$HOME:$HOME" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    ubuntu:latest /bin/bash
