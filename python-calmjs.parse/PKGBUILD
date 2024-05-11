# Maintainer: David Runge <dvzrv@archlinux.org>

_name=calmjs.parse
pkgname=python-calmjs.parse
pkgver=1.3.1
pkgrel=2
pkgdesc="Various parsers for ECMA standards"
arch=(any)
url="https://github.com/calmjs/calmjs.parse"
license=(MIT)
depends=(
  python
  python-ply
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('6bed01b67c6568a61663b9a489728cc428c5c001d000d4f468230809418d17e4253cf2ffb336e924fe654399484be2c770428f9e1da94c6a218cea6235fd7118')
b2sums=('134e71521d7287c0d082ccab31e99163f59d065bd1ad2af532fa542e20491856b5eaa42053480466e64f92873095e960648aae773bc2bafe04461f26c170102f')

prepare() {
  cd $_name-$pkgver
  # generate symbol tables required for lex and yacc
  # NOTE: this may require a specific python-ply version!
  PYTHONPATH="src:$PYTHONPATH" python -m calmjs.parse.parsers.optimize
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  PYTHONDONTWRITEBYTECODE=1 pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
