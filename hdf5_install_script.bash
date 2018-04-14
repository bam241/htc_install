#!/bin/bash

export hdf5_version=1.8.13

name=hdf5
version=$hdf5_version
folder=$name-$version
tarball=$name-$version.tar.gz
tar_f=$name-$version
url=https://www.hdfgroup.org/ftp/HDF5/releases/hdf5-$version/src/$tarball

mkdir $install_dir/$folder
cd $install_dir
ln -s $folder $name
cd $install_dir/$folder

wget $url
tar -xvf $tarball
mv $tar_f src
mkdir bld

config_string=
config_string+=" "--enable-shared
config_string+=" "--disable-debug
config_string+=" "--prefix=$install_dir/$folder

cd bld
../src/configure $config_string
make -j $jobs
make install

