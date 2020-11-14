#/bin/bash
#Update package using github api;suit for github release
pkgname=$1
pkgver=$(cat pkgbuild/${pkgname}/PKGBUILD|grep pkgver=|awk -F\= '{print $2}')
pkgonlinever=$(curl https://api.github.com/repos/$(cat pkgbuild/${pkgname}/PKGBUILD|grep source=|awk -F\/ '{print $4}')/$(cat pkgbuild/${pkgname}/PKGBUILD|grep source=|awk -F\/ '{print $5}')/releases/latest|grep tag_name|awk -F\" '{print $4}')
if [ ${pkgver} != ${pkgonlinever} ]; then
	sed -i '/pkgver=/cpkgver='"${pkgonlinever}" pkgbuild/${pkgname}/PKGBUILD
	echo "${pkgname}" >> need-update
fi
