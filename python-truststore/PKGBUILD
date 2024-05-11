# Maintainer: David Runge <dvzrv@archlinux.org>

_name=truststore
pkgname=python-truststore
pkgver=0.9.1
pkgrel=1
pkgdesc="Verify certificates using OS trust stores"
arch=(any)
url="https://github.com/sethmlarson/truststore"
license=(MIT)
depends=(
  python
)
makedepends=(
  python-build
  python-flit-core
  python-installer
  python-wheel
)
checkdepends=(
  python-aiohttp
  python-flaky
  python-httpx
  python-pyopenssl
  python-pytest
  python-pytest-asyncio
  python-pytest-httpserver
  python-requests
  python-trustme
  python-urllib3
)
optdepends=('python-urllib3: when injecting into SSLContext via urllib3')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('38567198a3b0d4e9c0b3df72674f3e1fef0614ef0afa80bd7276f98c2e7ef2dc00cca92184b80a1dfe535c5d2508ebdb775e389576c2f07536838f67de1958ca')
b2sums=('e5bf3905367f75cdfd9314f1c544f004e62c2ddcde97f83bfe5ddc2d7606d44df5fc352811c8c42423be2da46e5f7b9642a2aeebe61436669c4cd9265ddbec96')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # disable failing test: https://github.com/sethmlarson/truststore/issues/124
    --deselect tests/test_api.py::test_trustme_cert_loaded_via_capath
    # do not run tests that require network access
    # NOTE: not available in 0.8.0 yet
    # -m 'not internet'
  )
  cd $_name-$pkgver
  PYTHONPATH=src pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
