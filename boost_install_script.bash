#!/bin/bash

boost_version=1.61.0

name=boost
version=$boost_version
folder=$name-$version
tar_f=$name-$version

tarball=${name}_$version
tarball=`echo $tarball | sed s/'\.'/_/g`
tar_f=$tarball
tarball+=.tar.gz
url=https://sourceforge.net/projects/boost/files/boost/$version/$tarball

rm -rf $install_dir/$name
rm -rf $install_dir/$folder
mkdir $install_dir/$folder
cd $install_dir
ln -s $folder $name
cd $install_dir/$folder

wget $url
tar -xvf $tarball
mv $tar_f src
mkdir bld


mv $tar_f src

setup_string=
setup_string+=" "--prefix=$install_dir/$folder
setup_string+=" "--with-libraries=program_options,filesystem,system,serialization,regex

cd src
./bootstrap.sh  --show-libraries
./bootstrap.sh $setup_string
./b2 install

