#/bin/bash

cd rabbitvcs-git
python3 setup.py install --install-layout=deb --prefix=../rabbitvcs-debian/usr
cd ..
cp -r DEBIAN/ rabbitvcs-debian/
mkdir -p rabbitvcs-debian/usr/share/nemo-python/extensions
cp RabbitVCS.py rabbitvcs-debian/usr/share/nemo-python/extensions
#cp ./buildinfo.py rabbitvcs-debian/usr/lib/python3/dist-packages/rabbitvcs
sed -i 's/\.\.\/rabbitvcs\-debian//g' rabbitvcs-debian/usr/lib/python3/dist-packages/rabbitvcs/buildinfo.py
dpkg-deb --build rabbitvcs-debian/
