#!/bin/bash

boost_version=1.61.0
name=boost
version=$boost_version
folder=$name-$version
tar_f=$name-$version

tarball=${name}_$version
tarball=`echo $tarball | sed s/'\.'/_/g`
untar_f=$tarball
tarball+=.tar.gz

mkdir $install_dir/boost
cd $install_dir/boost

wget https://sourceforge.net/projects/boost/files/boost/$version/$tarball
tar -xvf $tarball

mv $tar_f src

setup_string=
setup_string+=" "--prefix=$install_dir/$folder
setup_string+=" "--with-libraries=program_options,filesystem,system,serialization,regex

cd src
./bootstrap.sh  --show-libraries
./bootstrap.sh $setup_string
./b2 install

