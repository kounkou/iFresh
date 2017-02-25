#!/bin/bash

# memorize the current dir
current_dir=$PWD

echo 'Phase I.  Installing CMake...'
sudo apt-get install --yes cmake

echo 'Phase II. Installing Qt'
if [ -f qt-5.7 ]; then
   ./qt-5.7
fi

if [ -f qt-5.7.env ]; then
   source qt-5.7.env
fi

# restore the current dir
cd ${current_dir}
