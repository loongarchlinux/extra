# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-rerunfailures
pkgname=python-pytest-rerunfailures
pkgver=12.0
pkgrel=1
pkgdesc="A plugin for py.test that re-runs failed tests to eliminate intermittent failures"
arch=(any)
url="https://github.com/pytest-dev/pytest-rerunfailures/"
license=(MPL2)
depends=(
  python
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
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('2e6787ec8b420344eb1f7175b0f9e7f8a2f3cc3fd59ebf0c49128b39dc887200bd497e1d73a59311d072456e34126a1829324a4d86f86e5c01916940383c8fd4')
b2sums=('3de39a8b92858bd90b312fca1c5f2e5ad790e12277f118bf18182b6192edf14dd160070bfe31ce981dc7ba41e0d0e2509ea80793c35c1856afdcfb5272ca55cc')

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
