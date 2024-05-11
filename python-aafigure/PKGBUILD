# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-aafigure
_name="${pkgname#python-}"
pkgver=0.6
pkgrel=5
pkgdesc="ASCII art to image converter"
arch=(any)
url="https://github.com/aafigure/aafigure"
license=(BSD-3-Clause)
depends=(
  python
  python-pillow
  python-reportlab
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('89e11b94e6b5514245d9f70bd5237ed476321be2359dd8e02b486923ed7a63f7ea482d7c239593537da18d0dd5d9381e74995b028b94c86b48e3d63948e3db2b')
b2sums=('59e1f1ae9dfc52a6cb22e090b13e3aecfb68f0592abb21ad7dca19db763ee2ff4524ed5b972cfb2534e119636443cc4f8a9de24c024b8a29a62af463a0d0c84b')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  pytest -v
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES.txt,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
