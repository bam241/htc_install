#!/bin/bash

export sigcpp_version=2.8.0

name=sigcpp
name_=sigc++
version=$sigcpp_version
folder=$name-$version
folder_=$name_-$version
tar_f=$name_-$version
tarball=lib${name_}-$version.tar.xz
url=https://download.gnome.org/sources/lib$name_/${version::3}/$tarball

rm -rf $install_dir/$folder
rm -rf $install_dir/$name
mkdir $install_dir/$folder
cd $install_dir
ln -s $folder $name
cd $install_dir/$folder

wget $url
tar -xvf $tarball
mv lib$tar_f src
mkdir bld

setup_string=
setup_string+=" "--prefix=$install_dir/$folder

cd src
./configure $setup_string
make -j $jobs
make install


