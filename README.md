# rabbitvcs-package

Simple project to help creation of rabbitvcs package with nemo on Debian.


Note you need to remove the rabbitvcs-core package.

```
git clone https://github.com/Jet1oeil/rabbitvcs-package.git
cd rabbitvcs-package
./build-pkg.sh
gdebi rabbitvcs-debian.deb
```

## Troubleshooting

__The authentication is not saved__

If the authentication is not saved, this may because you are using subversion with gnome-keyring for password storage.

You can bypass it, by modifying the data stored in files ~/.subversion/auth/svn.simple/. File the corrected UID for your server, and edit the file like this. 

```
K 8
passtype
V 6
simple
K 8
password
V 10
MYPASSWORD
K 15
svn:realmstring
V 42
<http://192.168.1.1:80> Subversion Repository
K 8
username
V 10
myusername
END
```
Note that integers stand for the caracters length.
