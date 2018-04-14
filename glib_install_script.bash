#!/bin/bash

name=glib
version=$glib_version
folder=$name-$version
tar_f=$name-$version
tarball=${name}-$version.tar.xz
url=http://ftp.gnome.org/pub/gnome/sources/$name/${version: : ${#version}-2}/$tarball

mkdir $install_dir/$folder
cd $install_dir
ln -s $folder $name
cd $install_dir/$folder

wget $url
tar -xvf $tarball
mv $tar_f src

setup_string=
setup_string+=" "--prefix=$install_dir/$folder
setup_string+=" "PKG_CONFIG_PATH=$install_dir/pcre/lib/pkgconfig

cd src 
./configure $setup_string
make -j $jobs
make install
