#!/bin/bash

# memorize the current dir
current_dir=$PWD

# For Qt 5.x
echo Downloading Qt
docker pull garthk/qt-build:trusty-5.7.0
docker run -t -i --rm -v $PWD:$PWD garthk/qt-build:trusty-5.7.0 bash

sudo apt-get install --yes cmake

# restore the current dir
cd ${current_dir}
