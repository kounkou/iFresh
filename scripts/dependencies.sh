#!/bin/bash

# memorize the current dir
current_dir=$PWD

# install qt
sudo apt-get -qq update
# For Qt 5.7
sudo apt-get install -y qt5-qmake qt5-default qdbus-qt5 qtquick1-5-dev qtscript5-dev qtbase5-dev qtdeclarative5-dev libqt5webkit5-dev libsqlite3-dev qttools5-dev-tools libcanberra-gtk-module libqt5svg5*
sudo add-apt-repository -y ppa:beineri/opt-qt551-trusty

# install gtest
sudo apt-get install libgtest-dev
sudo apt-get install cmake

cd /usr/src/gtest
sudo cmake CMakeLists.txt
sudo make
sudo cp *.a /usr/lib

# restore the current dir
cd ${current_dir}
