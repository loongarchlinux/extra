# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_name=pytest-httpserver
pkgname=python-pytest-httpserver
pkgver=1.0.10
pkgrel=2
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
sha256sums=('dc9e22b54184a9683a57eb18527dae4411fed3c5b421c52521043c192d058c9b')
b2sums=('061d3cf3745ee2951a8f5642d2c3761d80be885f908745d6b9243e8d59049c48cf9ee7196f7e043e17e41d09cbfaaedddf2bcdfb27eb4eceb83d446ed5dd570b')

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
