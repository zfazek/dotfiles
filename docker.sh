#!/bin/bash

docker run \
    --interactive \
    --rm \
    --tty \
    --hostname docker \
    --workdir="/root" \
    --volume="$HOME/ubuntu/:/root" \
    ubuntu:ezolfaz /bin/bash
