#!/bin/bash

# build the iFresh testing application only
cd tests
qmake -v
gcc --version
qmake -spec linux-g++ CONFIG+=debug CONFIG+=qml_debug -o Makefile iFresh.pro
make
./iFresh
