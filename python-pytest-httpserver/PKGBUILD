# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_name=pytest-httpserver
pkgname=python-pytest-httpserver
pkgver=1.1.0
pkgrel=1
pkgdesc="Http server for pytest to test http clients"
arch=(any)
url="https://github.com/csernazs/pytest-httpserver"
license=(MIT)
depends=(
  python
  python-pytest
  python-werkzeug
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
checkdepends=(
  python-ipdb
  python-pytest
  python-requests
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('4378ff64c5c305d7174d3f7aed9c00330c8bf6caa60ea0340885a9879aeee94d')
b2sums=('cc445e67e1d665e81fe47d3b65ac8f047b64783e1f450764982a3addd36d5ceab7101348e64da07be067c6dcc681ebb265c43417bfcdc4c6d9aa165e30e1bdfa')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv --ignore tests/test_release.py
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 CHANGES.rst README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
