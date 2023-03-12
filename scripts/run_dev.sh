#!/bin/bash

function print_error {
    tput setaf 1
    echo "$1"
    tput sgr0
}

function print_warning {
    tput setaf 3
    echo "$1"
    tput sgr0
}

function print_info {
    tput setaf 2
    echo "$1"
    tput sgr0
}

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Build project
print_info "Start dev container"

docker run --rm -it \
    --privileged \
    --network host \
    -v $ROOT/../src:/adaos_workspace/src \
    -v /dev/*:/dev/* \
    --workdir /adaos_workspace/ \
    --entrypoint /usr/local/bin/scripts/dev-entrypoint.sh \
    adaos-workspace-humble-cpu:beta \
    /bin/bash
