# Maintainer: David Runge <dvzrv@archlinux.org>

_name=click-help-colors
pkgname=python-click-help-colors
pkgver=0.9.4
pkgrel=2
pkgdesc="Colorization of help messages in Click"
arch=(any)
url="https://github.com/click-contrib/click-help-colors"
license=(MIT)
depends=(
  python
  python-click
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('9dd7cc972834e4711cd9f3e957ab50aaa9e7c3e983a98d2d35603a548c85c9c3d3104f567cd13250eb621b67d138b7b94771216dc8323a281fe4fee51d7b752e')
b2sums=('cb6e5818eddf8ac757206b537053368be672382133bd6a1de65653b671c8780e991b437a31313740303b0e9d6d84eccb04b84577149311c3a27ad9fdaae4c5a4')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  pytest -v
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 examples/*.py -t "$pkgdir/usr/share/doc/$pkgname/examples/"
}
