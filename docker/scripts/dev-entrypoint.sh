#!/bin/bash

echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source /opt/ros/humble/setup.bash

echo "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp" >> ~/.bashrc
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

sudo apt update
sudo apt upgrade -y
rosdep update

/bin/bash