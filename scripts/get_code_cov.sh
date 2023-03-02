#!/bin/bash

for filename in `find . | egrep '\.cpp'`; 
do 
  gcov-9 -n -o . $filename > /dev/null; 
done
