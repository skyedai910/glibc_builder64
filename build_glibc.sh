rm -rf /glibc
mkdir -p /glibc/$GLIBC_VERSION
mkdir -p /glibc_sources/$GLIBC_VERSION/64
cd /glibc_sources/$GLIBC_VERSION/64
wget http://mirrors.ustc.edu.cn/gnu/libc/glibc-${GLIBC_VERSION}.tar.gz
tar xf glibc-${GLIBC_VERSION}.tar.gz
cd glibc-${GLIBC_VERSION}
mkdir build
cd build
../configure --prefix=/glibc/${GLIBC_VERSION}/64/ --disable-werror --enable-debug=yes
make
make install
make clean
cd ../../
rm glibc-${GLIBC_VERSION}.tar.gz
