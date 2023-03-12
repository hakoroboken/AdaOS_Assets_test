#!/bin/bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $ROOT/util/print_util.sh


# IMAGE_NAME="robo2022:latest"
# print_warning "Launch image: ${IMAGE_NAME} with base: ${LAUCNHFILE_DIR}"
# read -rp ">  Are you sure you want to run setup? [y/N] " answer
# if ! [[ ${answer:0:1} =~ y|Y ]]; then
#     echo -e "\e[33mCancelled.\e[0m"
#     exit 1
# fi


docker run --rm -it \
    --privileged \
    --network host \
    -v $ROOT/../adaos_workspace/launch:/adaos_workspace/launch \
    -v /dev/*:/dev/* \
    --workdir /adaos_workspace/ \
    --entrypoint /usr/local/bin/scripts/launch-entrypoint.sh \
    sc3_gw:latest \
    /bin/bash