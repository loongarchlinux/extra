# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Will Shanks <wsha dot code at g mail dot com>

_pyname=terminado
pkgname=python-$_pyname
pkgver=0.18.1
pkgrel=2
pkgdesc='Terminals served to term.js using Tornado websockets'
url='https://github.com/takluyver/terminado'
arch=(any)
license=(BSD)
depends=(python
         python-ptyprocess
         python-tornado)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(python-pytest
              python-pytest-timeout)
source=(https://github.com/jupyter/terminado/releases/download/v$pkgver/$_pyname-$pkgver.tar.gz)
sha256sums=('de09f2c4b85de4765f7714688fff57d3e75bad1f909b589fde880460c753fd2e')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname-$pkgver
  pytest -v
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
