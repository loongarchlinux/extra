# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-css-parser
_name="${pkgname#python-}"
pkgver=1.0.10
pkgrel=2
pkgdesc='CSS related utilities for Python'
arch=('any')
url='https://github.com/ebook-utils/css-parser'
license=('LGPL-3.0-or-later')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d96581fb3c68bbf6da14a42aa01a385aef4ab90acf71c025361730b0802815e6a06006a4babf42e4b648a7a0f4b82d85944dba8f7998f6630e2a0ba09010464a')

build() {
  cd "$_name-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"

  PYTHONPATH="$(pwd)/build/lib" pytest -v
}

package() {
  cd "$_name-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
