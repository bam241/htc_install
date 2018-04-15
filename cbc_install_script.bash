#!/bin/bash

export cbc_version=2.9.8

name=Cbc
version=$cbc_version
folder=$name-$version
tar_f=$name-$version
tarball=${name}-$version.tgz
url=http://www.coin-or.org/download/source/$name/$tarball

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
setup_string+=" "--prefix=$install_dir/$folder

cd src
./configure $setup_string
make -j $jobs
make install

