# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-rerunfailures
pkgname=python-pytest-rerunfailures
pkgver=14.0
pkgrel=2
pkgdesc="A plugin for py.test that re-runs failed tests to eliminate intermittent failures"
arch=(any)
url="https://github.com/pytest-dev/pytest-rerunfailures/"
license=(MPL-2.0)
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
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('eee59c6008ec3fe8d5f9d9a7978383d58e36d3a8fa2fffdfc9dbad6264dc34902834fd96b7e909ec6ef9a276b0a5c628b8bdac03d7fcaf8459339ef38b5b1033')
b2sums=('ae320b3125e7deda3e11937f253349e46f81b60509f6ef142192b2741fb73249d9db9aa9f4a59a56c5cdcf25bad22c9943b72b92f086760cfc6b164bdf3299a6')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES.rst,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
}
