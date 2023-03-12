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


# Check Arg
if [ $# -eq 0 ]; then
    print_error "Not found image name."
    exit 1
fi

if [[ ! $1 =~ ":" ]]; then
    print_error "Not found tag name."
    exit 1
fi


docker run --rm -it \
    --privileged \
    --network host \
    -v $ROOT/../launch:/adaos_workspace/launch \
    -v /dev/*:/dev/* \
    --workdir /adaos_workspace/ \
    --entrypoint /usr/local/bin/scripts/launch-entrypoint.sh \
    $1 \
    /bin/bash
