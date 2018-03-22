#!/bin/bash

cd $install_dir/root
mkdir bld
cd bld
cmake_string=
cmake_string+=" "-DCMAKE_C_COMPILER=$install_dir/gcc/bin/gcc
cmake_string+=" "-DCMAKE_CXX_COMPILER=$install_dir/gcc/bin/g++
cmake_string+=" "-DCMAKE_INSTALL_PREFIX=$install_dir/root


cmake ../src $cmake_string
make
make install
