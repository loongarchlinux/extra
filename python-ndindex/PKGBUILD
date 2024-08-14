# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-ndindex
_pkgname=${pkgname#python-}
pkgver=1.8
pkgrel=3
pkgdesc="Library for manipulating indices of ndarrays"
arch=(any)
url="https://quansight-labs.github.io/ndindex/"
license=(MIT)
depends=(
  python
  python-numpy
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-versioneer
  python-wheel
)
checkdepends=(
  python-hypothesis
  python-pytest
)
source=("$pkgname-pkgver.tar.gz::https://github.com/Quansight-Labs/ndindex/archive/$pkgver/$pkgver.tar.gz")
sha256sums=('49f5e620a400fbbcf17c02ed884005f58341c9dcd6da6e713712bcee382c47f4')

prepare() {
  cd "$_pkgname-$pkgver"

  # Avoid packaging tests and benchmarks.
  sed -i 's/packages=.*/packages=setuptools.find_packages(exclude=["benchmarks", "ndindex.tests", "ndindex.tests*"]),/' setup.py
}

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  pytest --override-ini="addopts=" -W ignore::pytest.PytestUnknownMarkWarning
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
