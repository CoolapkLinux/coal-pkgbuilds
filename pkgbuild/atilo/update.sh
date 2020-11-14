#/bin/bash
#Update atilo's PKGBUILD
pkgname=atilo
pkgver=$(cat ./PKGBUILD|grep pkgver=|awk -F\= '{print $2}')
pkgonlinever=$(curl https://api.github.com/repos/$(cat ./PKGBUILD|grep source=|awk -F\/ '{print $4}')/$(cat ./PKGBUILD|grep source=|awk -F\/ '{print $5}')/releases/latest|grep tag_name|awk -F\" '{print $4}')
if [ ${pkgver} != ${pkgonlinever} ]; then
sed -i '/pkgver=/cpkgver='"${pkgonlinever}" ./PKGBUILD
echo "$pkg" >> need-update
fi
