# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-rerunfailures
pkgname=python-pytest-rerunfailures
pkgver=13.0
pkgrel=1
pkgdesc="A plugin for py.test that re-runs failed tests to eliminate intermittent failures"
arch=(any)
url="https://github.com/pytest-dev/pytest-rerunfailures/"
license=(MPL-2.0)
depends=(
  python
  python-importlib-metadata
  python-packaging
  python-pytest
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest-xdist
)
optdepends=(
  'python-pytest-xdist: for recovering from crashes'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('2ecce8d6f222772d9d800052198ae99c50b2a754d24937a9ef896b7f7951c0aabf12a1783ce982bd3de7c4ec1df58968c8106ed2a7bdea7e8c60e350fa973f2a')
b2sums=('1cef639c072fb0d4d9cb70c5d884d9438071f971cd77731f24a07b9eebf6c20f9bd9214867d0623165c69c54fb12b5c49d21af75fa9a356f41296d924f79ea48')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv -k 'not test_rerun_passes_after_temporary_test_crash'
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES.rst,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
}
