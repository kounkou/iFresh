#!/bin/bash

# memorize the current dir
current_dir=$PWD
echo ${current_dir}

cd scripts

echo 'Installing CMake...'
sudo update-alternatives --install /usr/bin/gcov gcov /usr/bin/gcov-5 90
sudo apt-get install --yes cmake

if [ -f qt-5.7 ]; then
   echo 'Launching qt-5.7 script from ${PWD}'
   ./qt-5.7
fi

# restore the current dir
cd ${current_dir}
