#!/bin/bash

export gmp_version=6.1.0

name=gmp
version=$gmp_version
folder=$name-$version
tarball=$name-$version.tar.bz2
tar_f=$name-$version
url=https://gmplib.org/download/gmp/$tarball

mkdir $install_dir/$folder
cd $install_dir
ln -s $folder $name
cd $install_dir/$folder

wget $url
tar -xvf $tarball
mv $tar_f src
mkdir bld

config_string=
config_string+=" "--prefix=$install_dir/$folder

cd bld
../src/configure $config_string
make -j $jobs
make install

