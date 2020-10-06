#/bin/bash

cd rabbitvcs-git
python3 setup.py install --install-layout=deb --prefix=/usr
cd ..
cp -r DEBIAN/ rabbitvcs-debian/
cp -r nemo-python/ rabbitvcs-debian/usr/share
cp ./buildinfo.py rabbitvcs-debian/usr/lib/python3/dist-packages/rabbitvcs
dpkg-deb --build rabbitvcs-debian/
