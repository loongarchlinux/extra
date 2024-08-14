# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

_pkgname=python3-xapp
pkgname=python-xapp
pkgver=2.4.2
pkgrel=1
pkgdesc="Python Xapp Library"
arch=('any')
url="https://github.com/linuxmint/${_pkgname}"
license=('LGPL')
depends=('python' 'python-psutil')
makedepends=('meson')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('04f995986eabaf613d166ae31bd36eda2b3563ea58aded64b132940430db9d59f9525eb562b0ad8d7649844adbaf28332c4f51fa633610b102feae97bc1bfc9f')

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
