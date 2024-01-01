# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=jsonmerge
pkgname=python-$_pkgname
pkgver=1.9.2
pkgrel=1
pkgdesc='Merge a series of JSON documents'
arch=('any')
url='https://github.com/avian2/jsonmerge'
license=('MIT')
depends=('python-jsonschema')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgname-$pkgver.tar.gz")
sha512sums=('59bb6c76d4f4c0ed090a6912f429666e129cffa3bd266516f8e7d21ee78da58c627b4f93dd5aea76b4b1606f52abe8991ad5924b0a3be68b9f69ca72b0b88dc7')

build() {
  cd $_pkgname-$_pkgname-$pkgver

  python setup.py build
}

check() {
  cd $_pkgname-$_pkgname-$pkgver

  python setup.py test
}

package() {
  cd $_pkgname-$_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
