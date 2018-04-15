#!/bin/bash

export pcre_version=8.38

name=pcre
version=$pcre_version
folder=$name-$version
tar_f=$name-$version
tarball=${name}-$version.tar.gz
url=ftp://ftp.csx.cam.ac.uk/pub/software/programming/$name/$tarball

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
setup_string+=" "--enable-utf
setup_string+=" "--enable-unicode-properties

cd src 
./configure $setup_string
make -j $jobs
make install

