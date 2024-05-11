# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pypng
pkgname=python-$_pkgname
pkgver=0.20231004.0
pkgrel=2
pkgdesc='Pure Python library for PNG image encoding/decoding'
arch=('any')
url='https://github.com/drj11/pypng'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(https://gitlab.com/drj11/pypng/-/archive/pypng-$pkgver/pypng-pypng-$pkgver.tar.gz)
sha512sums=('d1881ed5e6e64be5efba46ca509afc62c374fac7f384c679609658753f524f647b187b25aff602b9e4a2682a3d34945653f201f91372f7bb2755288ad35d89ee')

prepare() {
  cd $_pkgname-$_pkgname-$pkgver

  echo -e 'import setuptools\nsetuptools.setup()' >setup.py
}

build() {
  cd $_pkgname-$_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENCE
}

# vim:set ts=2 sw=2 et:
