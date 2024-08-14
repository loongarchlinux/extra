# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=python-pypng
pkgver=0.20231004.0
pkgrel=3
pkgdesc='Pure Python library for PNG image encoding/decoding'
arch=('any')
url='https://gitlab.com/drj11/pypng'
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$pkgname::git+$url#tag=pypng-$pkgver")
sha512sums=('a0209e8e2e6b83eca583518d5ff1083290633ce17adab84616e6f513c98731a3127ecf72dcaa3303297d6c67922ce6425e66e32c9fef3a5d03bc59e9b044a72f')
b2sums=('e1f5419fbc47f008c42f5ab1c2088c895f129de5e28a9aa8e7de909b04f79a820be5c9efa96ff7dd612e4f1bb5e61ac50044918d03b05b3a3eb1b5daeb013ea4')

#prepare() {
#  cd $_pkgname-$_pkgname-$pkgver
#
#  echo -e 'import setuptools\nsetuptools.setup()' >setup.py
#}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname/code"

  python -m unittest
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE
}
