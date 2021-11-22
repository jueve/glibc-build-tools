#!/bin/bash
set -euxo pipefail
cd $(dirname "$0")

case ${CPU_ARCH} in
  "x86_64")
    ${SOURCE_DIR}/configure \
      --prefix=${INSTALL_DIR} \
      --host=x86_64-linux-gnu \
      --build=x86_64-linux-gnu \
      CC="gcc -m64" \
      CXX="g++ -m64" \
      CFLAGS="-O2" \
      CXXFLAGS="-O2"
  ;;

  "i686")
    ${SOURCE_DIR}/configure \
      --prefix=${INSTALL_DIR} \
      --host=i686-linux \
      --build=i686-linux \
      CC="gcc -m32" \
      CXX="g++ -m32" \
      CFLAGS="-O2 -march=i686" \
      CXXFLAGS="-O2 -march=i686"
  ;;

  *)
    echo "The architecture '${CPU_ARCH}' is not supported."
    exit 1
  ;;
esac

make -j4
# make -j4 check
make -j4 install

