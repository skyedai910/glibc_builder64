rm -rf /glibc/$GLIBC_VERSION
mkdir -p /glibc/$GLIBC_VERSION
mkdir -p /glibc_sources/$GLIBC_VERSION/64
cd /glibc_sources/$GLIBC_VERSION/64
wget http://mirrors.ustc.edu.cn/gnu/libc/glibc-${GLIBC_VERSION}.tar.gz
tar xf glibc-${GLIBC_VERSION}.tar.gz
cd glibc-${GLIBC_VERSION}
mkdir build
cd build
CC="gcc" CXX="g++" \             
CFLAGS="-g -g3 -ggdb -gdwarf-4 -Og -Wno-error -fno-stack-protector" \
CXXFLAGS="-g -g3 -ggdb -gdwarf-4 -Og -Wno-error -fno-stack-protector" \
../configure --prefix=/glibc/${GLIBC_VERSION}/64/ --disable-werror
make
make install
cd ../../
rm glibc-${GLIBC_VERSION}.tar.gz
