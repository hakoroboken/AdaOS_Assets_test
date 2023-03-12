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

# Set workspace
WORKSPACE_NAME="$ROOT/../src"
if [ ! -d $WORKSPACE_NAME ]; then
    print_error "Project Not found."
    print_error "Run 'make_project.sh --git <git url>'"
    exit 1
fi


# Build project
print_info "Start project building"

docker run -it \
    --privileged \
    --network host \
    -v $ROOT/../src:/adaos_workspace/src \
    -v /dev/*:/dev/* \
    --workdir /adaos_workspace/ \
    --name adaos_build_workspace \
    --entrypoint /usr/local/bin/scripts/build-entrypoint.sh \
    adaos-workspace-humble-cpu:beta \
    /bin/bash

docker commit adaos_build_workspace $1
print_info "save container"

docker stop adaos_build_workspace
docker rm adaos_build_workspace

print_info "All task complete!"
