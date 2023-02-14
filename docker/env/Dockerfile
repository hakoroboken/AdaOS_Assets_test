FROM adaos_user:latest

ENV LANG=en_US.UTF-8
ENV ROS_PYTHON_VERSION=3

RUN sudo apt-get update && sudo apt upgrade -y
RUN sudo apt-get install -y software-properties-common
RUN sudo add-apt-repository -y universe
RUN sudo apt-get install -y curl gnupg2 lsb-release build-essential
RUN sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
RUN sudo apt update

RUN sudo apt install -y ros-humble-ros-base
RUN sudo apt install -y ros-dev-tools
RUN sudo rosdep init
RUN rosdep update

RUN sudo apt install -y ros-humble-rmw-cyclonedds-cpp

RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
RUN echo "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp" >> ~/.bashrc

WORKDIR /adaos_workspace
RUN sudo chmod 777 -R .