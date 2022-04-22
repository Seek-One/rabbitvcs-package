#/bin/bash

PYTHON=python3
SRC_DIR=./rabbitvcs-git
PKG_NAME=rabbitvcs-nemo-${PYTHON}-minimal
PKG_DIR=./${PKG_NAME}
PKG_PREFIX=../${PKG_NAME}

# Clear old file
rm -rf ${PKG_DIR}
rm -rf ${PKG_DIR}.deb

# Extensions
mkdir -p ${PKG_DIR}/usr/share/nemo-python/extensions
cp RabbitVCS.py ${PKG_DIR}/usr/share/nemo-python/extensions

# Package
cp -r minimal-package/DEBIAN/ ${PKG_DIR}

dpkg-deb --build ${PKG_DIR}/
