# Maintainer: David Runge <dvzrv@archlinux.org>

_name=kazoo
pkgname=python-kazoo
pkgver=2.10.0
pkgrel=2
pkgdesc="A high-level Python library that makes it easier to use Apache Zookeeper"
arch=(any)
url="https://github.com/python-zk/kazoo"
license=(Apache-2.0)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
# checkdepends=(python-nose python-objgraph)
optdepends=(
  'python-eventlet: for using eventlet as networking library'
  'python-gevent: for using gevent as networking library'
  'python-pure-sasl: for SASL support'
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('b65181ed1ace1676ac973f7d4cac9045600f9fc5b2499d50bd0502e32016ffe8caf267a54cdbab8bf216f42d40b8eba4cbfafe8360286fc373731dbfe883c231')
b2sums=('e1f43ac16c48a7756391fdb24c426943a54b0a6e04e7e07be16024d2b10f1d599fa5e33a3cdd170a71dde1deadc67a270615df24d839e138f248ad389cdf3973')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

# NOTE: check() requires running zookeeper
# check() {
#   cd $_name-$pkgver
#   export PYTHONPATH="build:${PYTHONPATH}"
# }

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES,CONTRIBUTING,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
