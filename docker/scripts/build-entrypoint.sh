#!/bin/bash

echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source /opt/ros/humble/setup.bash

echo "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp" >> ~/.bashrc
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

sudo apt update
sudo apt upgrade -y
rosdep update

rosdep install -y --from-paths src --ignore-src --rosdistro $ROS_DISTRO

colcon build

echo "source /adaos_workspace/install/setup.bash" >> ~/.bashrc
source /adaos_workspace/install/setup.bash

exit