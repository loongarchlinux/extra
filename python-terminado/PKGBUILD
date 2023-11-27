# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Will Shanks <wsha dot code at g mail dot com>

_pyname=terminado
pkgname=python-$_pyname
pkgver=0.18.0
pkgrel=1
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
sha256sums=('1ea08a89b835dd1b8c0c900d92848147cef2537243361b2e3f4dc15df9b6fded')

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
