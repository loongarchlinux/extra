# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-jsonrpclib-pelix
pkgver=0.4.3.3
pkgrel=1
pkgdesc="A Python JSON-RPC over HTTP that mirrors xmlrpclib syntax"
arch=(any)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
url="https://github.com/tcalmant/jsonrpclib"
license=('Apache-2.0')
source=(https://pypi.io/packages/source/j/jsonrpclib-pelix/jsonrpclib-pelix-$pkgver.tar.gz)
sha256sums=('c494fe7100b1139b1311469c28bc32d1cb92e4ff1f4511fb71d6807205dc3773')

build() {
  cd jsonrpclib-pelix-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd jsonrpclib-pelix-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
