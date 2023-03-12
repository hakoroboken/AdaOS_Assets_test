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
source $ROOT/util/print_util.sh

# Check Arg
if [ $# -eq 0 ]; then
    print_error "Not found git repo."
    exit 1
fi

if [ $1 = "-d" -a $# -ge 2]; then
    PKG_NAME= $2
    mkdir -p ${PKG_NAME}_workspace/src
    mkdir -p ${PKG_NAME}_workspace/launch
    mkdir -p ${PKG_NAME}_workspace/scripts
    exit 1
fi

mkdir ./workdir
cd ./workdir
git clone $1
cd ..

REPO_NAME="$(ls ./workdir)"
mkdir -p ${REPO_NAME}_workspace/src
mkdir -p ${REPO_NAME}_workspace/launch
mkdir -p ${REPO_NAME}_workspace/scripts

cp -r ./workdir/${REPO_NAME} ${REPO_NAME}_workspace/src

rm -rf ./workdir