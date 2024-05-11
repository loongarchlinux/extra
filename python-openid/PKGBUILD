# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-openid
_name="${pkgname//-/3-}"
pkgver=3.2.0
pkgrel=7
pkgdesc="Python 3 port of the python2-openid library"
arch=(any)
url="https://github.com/necaris/python3-openid"
license=(Apache-2.0)
depends=(
  python
  python-defusedxml
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-django
  python-httplib2
  python-mysqlclient
  python-psycopg2
  python-pycurl
  python-pytest
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v3.2.0.tar.gz)
sha512sums=('9fe9ffe1fe833b22bfb1f362bc5b03a4660126dad5ca29c1e4850f28d6e2e4067d98ce837b89f96c8c3ae939078d3720e06e4132a5e2e0fc162874f3a9ee1a73')
b2sums=('27a621c0d8c2cf1bf814a7f5c4e37e866dfea014c4d185b4fb54dd1c271b5ae80610a3d9451bbbee43ffe4f87352add57b8c2d4cb93899d062936ff5480e3266')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  python -m unittest openid.test.test_suite
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 NEWS.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
