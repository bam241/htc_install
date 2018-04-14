#!/bin/bash

export mpfr_version=3.1.4

name=mpfr
version=$mpfr_version
folder=$name-$version
tarball=$name-$version.tar.gz
tar_f=$name-$version
url=http://www.mpfr.org/mpfr-current/$tarball

mkdir $install_dir/$folder
cd $install_dir
ln -s $folder $name
cd $install_dir/$folder

wget $url
tar -xvf $tarball
mv $tar_f src
mkdir bld

config_string=
config_string+=" "--with-gmp=$install_dir/gmp
config_string+=" "--prefix=$install_dir/$folder

cd bld
../src/configure $config_string
make -j $jobs
make install
