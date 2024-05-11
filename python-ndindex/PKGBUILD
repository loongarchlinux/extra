# Maintainer:

_pyname=ndindex
pkgname=python-$_pyname
pkgver=1.8
pkgrel=2
pkgdesc='Library for manipulating indices of ndarrays'
arch=(any)
url='https://quansight-labs.github.io/ndindex/'
license=(MIT)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel python-versioneer)
checkdepends=(python-pytest-cov python-hypothesis python-pyflakes)
source=(https://github.com/Quansight-Labs/ndindex/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('49f5e620a400fbbcf17c02ed884005f58341c9dcd6da6e713712bcee382c47f4')

prepare() {
  cd $_pyname-$pkgver
  sed -e 's|--flakes||' -i pytest.ini
  rm versioneer.py
}

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname-$pkgver
  pytest -v
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
