# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Tim Schumacher <timschumi@gmx.de>

_pyname=ytmusicapi
pkgname=python-$_pyname
pkgver=1.5.1
pkgrel=1
pkgdesc='Unofficial API for YouTube Music'
arch=(any)
url='https://github.com/sigma67/ytmusicapi'
license=(MIT)
depends=(python
         python-requests)
makedepends=(python-build
             python-installer
             python-setuptools-scm
             python-sphinx
             python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
sha256sums=('3c9bf092a1142d880299c7e8d50a7f2c277337001798823011876939cf53395b')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
  make -C docs text
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  mkdir -p "$pkgdir"/usr/share/doc/$pkgname
  cp -r docs/build/text/* "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
