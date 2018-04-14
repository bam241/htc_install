#!/bin/bash

export glibmm_version=2.48.1

name=glibmm
version=$glibmm_version
folder=$name-$version
tar_f=$name-$version
tarball=${name}-$version.tar.xz
url=http://ftp.gnome.org/pub/GNOME/sources/$name/${version: : ${#version}-2}/$tarball

mkdir $install_dir/$folder
cd $install_dir
ln -s $folder $name
cd $install_dir/$folder

wget $url
tar -xvf $tarball
mv $tar_f src

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH
PKG_CONFIG_PATH+=":"$install_dir/sigcpp/lib/pkgconfig
PKG_CONFIG_PATH+=":"$install_dir/glib/lib/pkgconfig
PKG_CONFIG_PATH+=":"$install_dir/pcre/lib/pkgconfig

setup_string=
setup_string+=" "--prefix=$install_dir/$folder

cd src
./configure $setup_string
make -j $jobs
make install

