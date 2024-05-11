# Maintainer: Antonio Rojas <arojas@archlinux.com>

_pyname=sqlite-anyio
pkgname=python-$_pyname
pkgver=0.2.0
pkgrel=2
pkgdesc='Asynchronous client for SQLite using AnyIO'
arch=(any)
url='https://github.com/davidbrochart/sqlite-anyio'
license=(MIT)
depends=(python
         python-anyio)
makedepends=(git
             python-build
             python-hatchling
             python-installer)
checkdepends=(python-pytest
              python-trio)
source=(git+https://github.com/davidbrochart/sqlite-anyio#tag=v$pkgver)
sha256sums=('2a08ce8d2716a604076f00c2c098dcf374c9137989bf8a7bac8ba1c0d5abea71')

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
  PYTHONPATH="$PWD" \
  pytest -v
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
