#!/bin/bash

export        gcc_version=5.4.0

name=gcc
version=$gcc_version
folder=$name-$version
tarball=$name-$version.tar.gz
tar_f=$name-$version
url=http://www.netgull.com/gcc/releases/gcc-$version/$tarball

rm -rf $install_dir/$folder
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
config_string+=" "--with-mpfr=$install_dir/mpfr
config_string+=" "--with-mpc=$install_dir/mpc
config_string+=" "--prefix=$install_dir/$folder
config_string+=" "--enable-threads
cd bld
../src/configure $config_string
make -j $jobs
make install

