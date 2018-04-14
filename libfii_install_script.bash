#!/bin/bash

export libfii_version=3.2.1

name=libfii
version=$libfii_version
folder=$name-$version
tar_f=$name-$version
tarball=${name}-$version.tar.gz
url=iftp://sourceware.org/pub/$name/$tarball

mkdir $install_dir/$folder
cd $install_dir
ln -s $folder $name
cd $install_dir/$folder

wget $url
tar -xvf $tarball
mv $tar_f src

setup_string=
setup_string+=" "--prefix=$install_dir/$folder

cd src 
./configure $setup_string
make -j $jobs
make install
