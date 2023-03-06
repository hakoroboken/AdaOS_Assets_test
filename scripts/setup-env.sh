#!/bin/bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $ROOT/util/print_util.sh
DOCKER_DIR="${ROOT}/../docker"

# Prevent running as root.
if [[ $(id -u) -eq 0 ]]; then
    print_error "Please re-run without sudo."
    exit 1
fi

# Check if user can run docker without root.
RE="\<docker\>"
if [[ ! $(groups $USER) =~ $RE ]]; then
    print_error "User |$USER| is not a member of the 'docker' group and cannot run docker commands without sudo."
    print_error "Run 'sudo usermod -aG docker \$USER && newgrp docker'."
    exit 1
fi

print_info "Environment check complete."

# Build docker image
print_info "Build docker image"
docker image build -t adaos-user-cpu:beta -f $DOCKER_DIR/Dockerfile.cpu.user $DOCKER_DIR
docker image build -t adaos-workspace-humble-cpu:beta -f $DOCKER_DIR/Dockerfile.cpu.humble $DOCKER_DIR

print_info "Created environment"
