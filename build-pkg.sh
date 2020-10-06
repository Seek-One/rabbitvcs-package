#/bin/bash

SRC_DIR=./rabbitvcs-git
PKG_DIR=./rabbitvcs-nemo-pkg
PKG_PREFIX=../rabbitvcs-nemo-pkg
PKG_PREFIX_SAFE=\\.\\.\\/rabbitvcs\\-nemo\\-pkg

cd ${SRC_DIR}
python3 setup.py install --install-layout=deb --prefix=${PKG_PREFIX}/usr
cd ..
cp -r DEBIAN/ ${PKG_DIR}
mkdir -p ${PKG_DIR}/usr/share/nemo-python/extensions
cp RabbitVCS.py ${PKG_DIR}/usr/share/nemo-python/extensions
sed -i "s/${PKG_PREFIX_SAFE}//g" ${PKG_DIR}/usr/lib/python3/dist-packages/rabbitvcs/buildinfo.py
dpkg-deb --build ${PKG_DIR}/
