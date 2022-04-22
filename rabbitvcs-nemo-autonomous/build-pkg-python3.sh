#/bin/bash

PYTHON=python3
SRC_DIR=./rabbitvcs-git
PKG_DIR=./rabbitvcs-nemo-${PYTHON}
PKG_PREFIX=../rabbitvcs-nemo-${PYTHON}
PKG_PREFIX_SAFE=\\.\\.\\/rabbitvcs\\-nemo\\-${PYTHON}

# Clear old file
rm -rf ${PKG_DIR}
rm -rf ${PKG_DIR}.deb

# Application
cd ${SRC_DIR}
${PYTHON} setup.py install --install-layout=deb --prefix=${PKG_PREFIX}/usr
cd ..
sed -i "s/${PKG_PREFIX_SAFE}//g" ${PKG_DIR}/usr/lib/${PYTHON}/dist-packages/rabbitvcs/buildinfo.py



# Extensions
mkdir -p ${PKG_DIR}/usr/share/nemo-python/extensions
cp RabbitVCS.py ${PKG_DIR}/usr/share/nemo-python/extensions

# Package
cp -r DEBIAN/ ${PKG_DIR}

dpkg-deb --build ${PKG_DIR}/
