#!/bin/bash

name=xmlpp
name_=xml++
version=$xmlpp_version
folder=$name-$version
folder_=$name_-$version
tar_f=lib$name_-$version
tarball=lib${name_}-$version.tar.xz
url=http://ftp.gnome.org/pub/GNOME/sources/lib$name_/${xmlpp_version:0:4}/$tarball

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
PKG_CONFIG_PATH+=":"$install_dir/glibmm/lib/pkgconfig
PKG_CONFIG_PATH+=":"$install_dir/xml2/lib/pkgconfig

setup_string=
setup_string+=" "--prefix=$install_dir/$folder

cd src
./configure $setup_string
make -j $jobs
make install
