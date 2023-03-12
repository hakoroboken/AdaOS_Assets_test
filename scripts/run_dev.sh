#!/bin/bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $ROOT/util/print_util.sh

# # Set workspace
# WORKSPACE_NAME="$ROOT/../adaos_workspace/src"
# if [ ! -d $WORKSPACE_NAME ]; then
#     print_error "Project Not found."
#     print_info "Run 'make_project.sh --git <git url>'"
#     exit 1
# fi


# Build project
print_info "Start dev container"

docker run --rm -it \
    --privileged \
    --network host \
    -v $ROOT/../adaos_workspace/src:/adaos_workspace/src \
    -v /dev/*:/dev/* \
    --workdir /adaos_workspace/ \
    --entrypoint /usr/local/bin/scripts/dev-entrypoint.sh \
    adaos-workspace-humble-cpu:beta \
    /bin/bash