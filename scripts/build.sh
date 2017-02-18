#!/bin/bash

# build the iFresh application
qmake -spec linux-g++ CONFIG+=debug CONFIG+=qml_debug -o Makefile ../iFresh/iFresh.pro
