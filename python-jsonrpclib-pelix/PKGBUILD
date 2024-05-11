# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-jsonrpclib-pelix
pkgver=0.4.3.2
pkgrel=3
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
sha256sums=('e9e0b33efa8fa20d817dd78dfd9e4cdb3967c8a5d3cb5a783be1ee81c4a89c7c')

build() {
  cd jsonrpclib-pelix-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd jsonrpclib-pelix-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
