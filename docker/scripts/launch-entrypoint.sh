#!/bin/bash

echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source /opt/ros/humble/setup.bash

echo "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp" >> ~/.bashrc
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

echo "source /adaos_workspace/install/setup.bash" >> ~/.bashrc
source /adaos_workspace/install/setup.bash

ros2 launch /adaos_workspace/launch/*.adaos-exe.py

exit