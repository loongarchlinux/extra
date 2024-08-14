# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Tim Schumacher <timschumi@gmx.de>

_pyname=ytmusicapi
pkgname=python-$_pyname
pkgver=1.8.0
pkgrel=1
pkgdesc='Unofficial API for YouTube Music'
arch=(any)
url='https://github.com/sigma67/ytmusicapi'
license=(MIT)
depends=(python
         python-requests)
makedepends=(git
             python-build
             python-installer
             python-setuptools-scm
             python-sphinx
             python-wheel)
source=(git+https://github.com/sigma67/ytmusicapi#tag=$pkgver)
sha256sums=('53e7823ed058326984b8f3b744d575b80492b166c3e2935d109d30dea2c3eca7')

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
  make -C docs text
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl

  mkdir -p "$pkgdir"/usr/share/doc/$pkgname
  cp -r docs/build/text/* "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
