# Maintainer: David Runge <dvzrv@archlinux.org>

_name=geopy
pkgname=python-geopy
_commit=e61648db147c522a167c1f0935c9b4bf7dff623c  # refs/tags/2.4.0
pkgver=2.4.0
pkgrel=1
pkgdesc="Geocoding library for Python"
arch=(any)
url="https://github.com/geopy/geopy"
license=(MIT)
depends=(
  python
  python-geographiclib
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-aiohttp
  python-async_generator
  python-pytest-asyncio
  python-pytest-aiohttp
  python-pytest
  python-pytz
  python-requests
)
optdepends=(
  'python-aiohttp: for async http support'
  'python-requests: for requests support'
  'python-pytz: for timezone support'
)
source=("git+$url#tag=$_commit?signed")
sha512sums=('SKIP')
b2sums=('SKIP')
validpgpkeys=('A18FE9F6F570D5B4E1E1853FAA7B5406547AF062') # Kostya Esmukov <kostya@esmukov.ru>

pkgver() {
  cd $_name
  git describe --tags | sed 's/^v//'
}

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --deselect test/adapters/each_adapter.py::test_geocoder_constructor_uses_https_proxy
    --deselect test/adapters/each_adapter.py::test_geocoder_https_proxy_auth_is_respected
    --ignore=test/geocoders
  )

  cd $_name
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
