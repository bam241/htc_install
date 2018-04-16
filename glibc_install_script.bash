#!/bin/bash

export glibc_version=2.14

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

#working LD_LIB
#/tmp/mouginot/opt/pcre/lib:/tmp/mouginot/opt/sigc++/lib:/tmp/mouginot/opt/boost/lib:/tmp/mouginot/opt/lapack/lib:/tmp/mouginot/opt/hdf5/lib:/tmp/mouginot/opt/python/lib:/tmp/mouginot/opt/cmake/lib:/tmp/mouginot/opt/gcc/lib64:/tmp/mouginot/opt/gcc/lib:/tmp/mouginot/opt/mpc/lib:/tmp/mouginot/opt/mpfr/lib:/tmp/mouginot/opt/gmp/lib/


#unset LD_LIBRARY_PATH
#echo $LD_LIBRARY_PATH

setup_string=
setup_string+=" "--prefix=$install_dir/$folder

cd src
mkdir autoconf
cd autoconf
../configure $setup_string
make
make install
