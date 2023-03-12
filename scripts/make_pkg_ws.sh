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
    print_error "Not found git repo."
    exit 1
fi

if [ $1 = "-d" ]; then
    PKG_NAME=$2
    mkdir -p $ROOT/${PKG_NAME}_workspace/src
    mkdir -p $ROOT/${PKG_NAME}_workspace/launch
    mkdir -p $ROOT/${PKG_NAME}_workspace/scripts
elif [ $1 = "-m" ]; then
    echo "Hello"
else
    mkdir $ROOT/workdir
    cd $ROOT/workdir
    git clone $1
    cd $ROOT/

    PKG_NAME="$(ls $ROOT//workdir)"
    mkdir -p $ROOT/${PKG_NAME}_workspace/src
    mkdir -p $ROOT/${PKG_NAME}_workspace/launch
    mkdir -p $ROOT/${PKG_NAME}_workspace/scripts

    cp -r $ROOT/workdir/${PKG_NAME} $ROOT/${PKG_NAME}_workspace/src

    rm -rf $ROOT/workdir
fi

cd $ROOT/${PKG_NAME}_workspace/scripts
wget -q -nc	https://raw.githubusercontent.com/hakoroboken/AdaOS_Assets_test/main/scripts/make_pkg_image.sh
wget -q https://raw.githubusercontent.com/hakoroboken/AdaOS_Assets_test/main/scripts/run_dev.sh
wget -q https://raw.githubusercontent.com/hakoroboken/AdaOS_Assets_test/main/scripts/launch.sh

chmod +x $ROOT/${PKG_NAME}_workspace/scripts/*.sh

cd $ROOT/${PKG_NAME}_workspace/

touch $ROOT/${PKG_NAME}_workspace/launch/${PKG_NAME}.adaos-exe.py
chmod +x $ROOT/${PKG_NAME}_workspace/launch/${PKG_NAME}.adaos-exe.py

print_info "$PKG_NAME is created"
