mkdir -p ./adaos_workspace/src

docker run --rm -it \
--privileged \
--network host \
-v ./adaos_workspace/src:/adaos_workspace/src \
-v /dev/*:/dev/* \
--workdir /adaos_workspace/ \
adaos_env:latest