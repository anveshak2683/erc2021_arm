#!/bin/bash
sudo apt-get update && apt-get upgrade -y && apt-get install -y lsb-core g++
rosdep init && rosdep update
mkdir -p /catkin_ws/src
cd /catkin_ws/src && git clone https://github.com/Michal-Bidzinski/ERC_2021_simulator.git
apt install ros-melodic-industrial-core -y
rosdep update
rosdep install --from-paths /catkin_ws/src/ --ignore-src --rosdistro melodic -r -y
sudo apt install ros-melodic-teleop* -y
sudo apt install ros-melodic-joy* -y
sudo apt install ros-melodic-aruco-ros* -y


