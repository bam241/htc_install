#!/bin/bash

export sqlite_version=3130000

name=sqlite
version=$sqlite_version
folder=$name-$version
tar_f=$name-$version
tarball=$name-autoconf-$version.tar.gz
url=https://www.sqlite.org/2016/$tarball

mkdir $install_dir/$folder
cd $install_dir
ln -s $folder $name
cd $install_dir/$folder

wget $url
tar -xvf $tarball
mv $tar_f src
mkdir bld

setup_string=
setup_string+=" "--prefix=$install_dir/$folder

cd $name-autoconf-$version
./configure $setup_string
make -j $jobs
make install


