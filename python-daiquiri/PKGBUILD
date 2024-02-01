# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-daiquiri
pkgver=3.2.4
_commit=838233522261c30614631fee3f03286a41c47b72
pkgrel=1
pkgdesc='Library to configure Python logging easily'
arch=('any')
license=('Apache')
url='https://github.com/Mergifyio/daiquiri'
depends=('python-json-logger')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm'
             'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/Mergifyio/daiquiri.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd daiquiri
  python -m build -nw
}

check() {
  cd daiquiri
  python -m pytest
}

package() {
  cd daiquiri
  python -m installer -d "$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
