#/bin/bash

PYTHON=python2.7
SRC_DIR=./rabbitvcs-git
PKG_NAME=rabbitvcs-nemo-${PYTHON}-full
PKG_DIR=./${PKG_NAME}
PKG_PREFIX=../${PKG_NAME}
PKG_PREFIX_SAFE=\\.\\.\\/rabbitvcs\\-nemo\\-${PYTHON}-full

# Clear old file
rm -rf ${PKG_DIR}
rm -rf ${PKG_DIR}.deb

# Application
cd ${SRC_DIR}
${PYTHON} setup.py install --install-layout=deb --prefix=${PKG_PREFIX}/usr
cd ..
sed -i "s/${PKG_PREFIX_SAFE}//g" ${PKG_DIR}/usr/lib/${PYTHON}/dist-packages/rabbitvcs/buildinfo.py
find ${PKG_DIR} -name "*.pyc" -exec rm -f {} \;
${PYTHON} -m compileall ${PKG_DIR}/usr/lib/${PYTHON}/dist-packages

# Extensions
mkdir -p ${PKG_DIR}/usr/share/nemo-python/extensions
cp RabbitVCS.py ${PKG_DIR}/usr/share/nemo-python/extensions

# Package
cp -r full-package/DEBIAN/ ${PKG_DIR}
sed -i "s/python3/python/g" ${PKG_DIR}/DEBIAN/control
dpkg-deb --build ${PKG_DIR}/
