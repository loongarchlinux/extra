# Maintainer: David Runge <dvzrv@archlinux.org>

_name=unearth
pkgname=python-unearth
pkgver=0.15.2
pkgrel=2
pkgdesc="A utility to fetch and download python packages"
arch=(any)
url="https://github.com/frostming/unearth"
license=(MIT)
depends=(
  python
  python-packaging
  python-httpx
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
  python-wheel
)
checkdepends=(
  python-flask
  python-pytest
  python-pytest-mock
  python-pytest-httpserver
  python-requests-wsgi-adapter
  python-trustme
)
optdepends=(
  'python-keyring: use keyring for authentication'
  'python-requests: use legacy facilities for download'
)
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz
)
sha512sums=('46d0ecb7831a4d19e0efe182b3c9af3074a960ebb1f388106649b58c3f9fc8d65a64ee86f31d72dae0f37a7a2b667c00dce4a3fcae7e186c88e3b57b2ca7a7bc')
b2sums=('9921dba5e0e29a7881843c34b11044b9b964178b80738758c230fe37c0fbd15a2d28a0d1195edc7584917e4b119adbf5300df7ed23e7636f5659751e154ecb2f')

build() {
  cd $_name-$pkgver
  export PDM_BUILD_SCM_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
