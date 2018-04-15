#!/bin/bash

export glibc_version=2.18

name=glibc
version=$glibc_version
folder=$name-$version
tar_f=$name-$version
tarball=${name}-$version.tar.xz
url=http://ftp.gnu.org/gnu/$name/$tarball

rm -rf $install_dir/$folder
rm -rf $install_dir/$name
mkdir $install_dir/$folder
cd $install_dir
ln -s $folder $name
cd $install_dir/$folder

wget $url
tar -xJvf $tarball
mv $tar_f src

unset LD_LIBRARY_PATH

setup_string=
setup_string+=" "--prefix=$install_dir/$folder

cd src
mkdir bld
cd bld
../configure $setup_string
make -j $jobs
make install
