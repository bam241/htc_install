#!/bin/bash

name=xml2
version=$xml2_version
folder=$name-$version
tar_f=lib$name-$version
tarball=lib${name}-$version.tar.gz
url=ftp://xmlsoft.org/libxml2/$tarball

rm -rf $install_dir/$folder
rm -rf $install_dir/$name
mkdir $install_dir/$folder
cd $install_dir
ln -s $folder $name
cd $install_dir/$folder

wget $url
tar -xvf $tarball
mv $tar_f src

setup_string=
setup_string+=" "--with-python=no
setup_string+=" "--prefix=$install_dir/$folder

cd src 
./configure $setup_string
make -j $jobs
make install
