# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=libusb1
pkgname=python-$_pkgname
pkgver=3.1.0
pkgrel=2
pkgdesc='Python ctype-based wrapper around libusb1'
arch=('any')
url='https://github.com/vpelletier/python-libusb1'
license=('LGPL2.1')
depends=('python' 'libusb')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('590929bbef2fac8f9bfcac7efde0670787aeb27952b5cfc370bbcb8df67fb002774853f1fd5794f73b2396636d647919731cb6ec92b5b99b87265c24b04a5c97')

build() {
  cd $pkgname-$pkgver

  python -m build -nw
}

package() {
  cd $pkgname-$pkgver

  python -m installer -d "$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
