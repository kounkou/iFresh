#!/bin/bash

# memorize the current dir
current_dir=$PWD
echo ${current_dir}

cd scripts

echo 'Phase I.  Installing CMake...'
sudo apt-get install --yes cmake

echo 'Phase II. Installing Qt'
if [ -f qt-5.7 ]; then
   ./qt-5.7
fi

echo `ls`

if [ -f qt-5.7.env ]; then
   source qt-5.7.env
fi

echo $PATH

# restore the current dir
cd ${current_dir}
