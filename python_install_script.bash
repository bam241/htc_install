#!/bin/bash

python_version=2.7.11

name=python
version=$python_version
folder=$name-$version
tarball=Python-$version.tgz
tar_f=Python-$version
url=https://www.python.org/ftp/python/$version/$tarball

mkdir $install_dir/$folder
cd $install_dir
ln -s $folder $name
cd $install_dir/$folder

wget $url
tar -xvf $tarball
mv $tar_f src

config_string=
config_string+=" "--enable-shared
config_string+=" "--prefix=$install_dir/$folder

mkdir bld
cd bld
../src/configure $config_string
make -j $jobs
make install

