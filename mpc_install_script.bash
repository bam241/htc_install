#!/bin/bash
export mpc_version=1.0.3

name=mpc
version=$mpc_version
folder=$name-$version
tarball=$name-$version.tar.gz
tar_f=$name-$version
url=ftp://ftp.gnu.org/gnu/mpc/$tarball

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
config_string+=" "--prefix=$install_dir/$folder

cd bld
../src/configure $config_string
make -j $jobs
make install
