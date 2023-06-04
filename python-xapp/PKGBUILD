# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

_pkgname=python3-xapp
pkgname=python-xapp
pkgver=2.4.1
pkgrel=1
pkgdesc="Python Xapp Library"
arch=('any')
url="https://github.com/linuxmint/${_pkgname}"
license=('LGPL')
depends=('python' 'python-psutil')
makedepends=('meson')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('97045061aa5965adcfe7301774dbd35a226fa9b846e31a7c097229cc417ff4008e518ebd5b600d4ce6a46daa39d51de70d391b6b0a7c78490419d3a96daca6a9')

build(){
  meson build ${_pkgname}-${pkgver} \
    --prefix=/usr
  meson compile -C build
}

package() {
  meson install -C build --destdir="${pkgdir}"

  # compile Python bytecode
  python -m compileall -d / "$pkgdir"/usr/lib
  python -O -m compileall -d / "$pkgdir"/usr/lib
}
