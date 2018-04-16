#!/bin/bash

cd $install_dir/cyclus


export PKG_CONFIG_PATH=$PKG_CONFIG_PATH
PKG_CONFIG_PATH+=":"$install_dir/sigcpp/lib/pkgconfig
PKG_CONFIG_PATH+=":"$install_dir/glib/lib/pkgconfig
PKG_CONFIG_PATH+=":"$install_dir/pcre/lib/pkgconfig
PKG_CONFIG_PATH+=":"$install_dir/glibmm/lib/pkgconfig
PKG_CONFIG_PATH+=":"$install_dir/xml2/lib/pkgconfig

export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH
CMAKE_PREFIX_PATH+=":"$install_dir/sigcpp
CMAKE_PREFIX_PATH+=":"$install_dir/glib
CMAKE_PREFIX_PATH+=":"$install_dir/pcre
CMAKE_PREFIX_PATH+=":"$install_dir/glibmm
CMAKE_PREFIX_PATH+=":"$install_dir/xml2
CMAKE_PREFIX_PATH+=":"$install_dir/xmlpp
CMAKE_PREFIX_PATH+=":"$install_dir/sqlite
CMAKE_PREFIX_PATH+=":"$install_dir/boost
CMAKE_INCLUDE_PATH+=$install_dir/boost/include

echo $CMAKE_INCLUDE_PATH

setup_string= 
setup_string+=" "--hdf5_root=$install_dir/hdf5
setup_string+=" "--coin_root=$install_dir/Cbc 
setup_string+=" "-DBoost_NO_BOOST_CMAKE=TRUE
setup_string+=" "-DBoost_NO_SYSTEM_PATHS=TRUE
setup_string+=" "-DBOOST_ROOT:PATHNAME=$install_dir/boost 
setup_string+=" "-DCMAKE_C_COMPILER=$install_dir/gcc/bin/gcc 
setup_string+=" "-DCMAKE_CXX_COMPILER=$install_dir/gcc/bin/g++ 
setup_string+=" "-DCMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH 
setup_string+=" "-DCMAKE_INCLUDE_PATH=$CMAKE_INCLUDE_PATH

setup_string_2=
setup_string_2+=" "--build_dir=cyclus_bld
setup_string_2+=" "--prefix=$install_dir/cyclus
  
python install.py $setup_string  $setup_string_2 --clean-build
