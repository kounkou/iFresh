#!/bin/bash

# memorize the current dir
current_dir=$PWD
echo ${current_dir}

cd scripts

echo 'Installing CMake...'
sudo apt-get install --yes cmake

if [ -f qt-5.7 ]; then
   echo 'Launching qt-5.7 script from ${PWD}'
   ./qt-5.7
fi

echo `ls`

if [ -f qt-5.7.env ]; then
   echo 'Sourcing qt-5.7.env'
   source qt-5.7.env
fi

echo $PATH

# restore the current dir
cd ${current_dir}
