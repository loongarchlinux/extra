# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=sip
pkgver=6.8.2
pkgrel=1
arch=(any)
pkgdesc='A tool that makes it easy to create Python bindings for C and C++ libraries'
url='https://www.riverbankcomputing.com/software/sip/intro'
license=('custom:"sip"')
depends=(python
         python-packaging
         python-setuptools
         python-tomli)
makedepends=(python-build
             python-installer
             python-wheel)
source=(https://pypi.python.org/packages/source/s/sip/$pkgname-$pkgver.tar.gz)
sha256sums=('2e65a423037422ccfde095c257703a8ff45cc1c89bdaa294d7819bc836c87639')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
