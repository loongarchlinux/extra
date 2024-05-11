# Maintainer: David Runge <dvzrv@archlinux.org>

_name=nethsm-sdk-py
pkgname=python-nethsm-sdk-py
pkgver=1.0.0
pkgrel=2
pkgdesc="Client-side Python SDK for NetHSM"
arch=(any)
url="https://github.com/Nitrokey/nethsm-sdk-py"
license=(Apache-2.0)
depends=(
  python
  python-certifi
  python-cryptography
  python-dateutil
  python-typing_extensions
  python-urllib3
)
makedepends=(
  python-build
  python-flit-core
  python-installer
  python-wheel
)
provides=(python-nethsm)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('c08b195288c0a13207f447e5fcedcad63e87f960c178ec9bedbc0b82db8f99cd06b1d152fb83994f8353f85da740760eca2fdc5628ad909f1c61fa787dd2a9f9')
b2sums=('00c0b30ac6f730e3b2b87a5edbdc5268215184eb8578be81eb2c094a9067bd86d9dc833db5d496532e636fd6966354cff1bd34d22b334de2f5a99539a26918ba')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

# NOTE: all tests are disabled, because they require docker

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
