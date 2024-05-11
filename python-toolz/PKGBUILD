# Maintainer: David Runge <dvzrv@archlinux.org>

_name=toolz
pkgname=python-toolz
pkgver=0.12.1
pkgrel=2
pkgdesc="A functional standard library for Python"
arch=(any)
url="https://github.com/pytoolz/toolz/"
license=(BSD-3-Clause)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('c514934d1a8069cd70e4d8b9ca32cd2c96e85b1dabb45bbbe4b0644581eb7e7f9f6a6d9230483f1872695edf25ff77ad7643cffb3041a012ed64424097a23e9e')
b2sums=('41b2002147cd453c2a8300c7ec247e06dfc8fba69a772df4a8f5c35349e991453bbbd0d7ed0162391d9314873bf0e169d20c86b875e4d4eca01aaadc76edea61')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:${PYTHONPATH}"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
