#/bin/bash

PYTHON=python3
SRC_DIR=./rabbitvcs-git
PKG_DIR=./rabbitvcs-nemo-${PYTHON}
PKG_PREFIX=../rabbitvcs-nemo-${PYTHON}
PKG_PREFIX_SAFE=\\.\\.\\/rabbitvcs\\-nemo\\-${PYTHON}

# Clear old file
rm -rf ${PKG_DIR}
rm -rf ${PKG_DIR}.deb

# Extensions
mkdir -p ${PKG_DIR}/usr/share/nemo-python/extensions
cp RabbitVCS.py ${PKG_DIR}/usr/share/nemo-python/extensions

# Package
cp -r DEBIAN/ ${PKG_DIR}

dpkg-deb --build ${PKG_DIR}/
