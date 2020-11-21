#/bin/bash
#Update package using github api;suit for github release
update(){
  pkgname=$1
  arg=$2
  pkgver=$(cat pkgbuild/${pkgname}/PKGBUILD|grep pkgver=|awk -F\= '{print $2}')
  pkgonlinever=$(curl https://api.github.com/repos/$(cat pkgbuild/${pkgname}/PKGBUILD|grep source=|awk -F\/ '{print $4}')/$(cat pkgbuild/${pkgname}/PKGBUILD|grep source=|awk -F\/ '{print $5}')/releases/latest|grep tag_name|awk -F\" '{print $4}')
  case arg in
  v)
    pkgonlinever=$(echo ${pkgonlinever}|sed 's/v//g')
  ::
  esac
  if [ ${pkgver} != ${pkgonlinever} ]; then
    sed -i '/pkgver=/cpkgver='"${pkgonlinever}" pkgbuild/${pkgname}/PKGBUILD
    echo "${pkgname}" >> need-update
  fi
  return 0
}
for pkgname in `ls -AF pkgbuild |grep '/$' | tr -d '/'`
do
  examine_arg=(cat pkgbuild/${pkgname}/PKGBUILD|grep \#examine=|awk -F\= '{print $2}')
  update(${pkgname} ${examine_arg})
done
