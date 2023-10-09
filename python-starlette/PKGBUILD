# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_name=starlette
pkgname=python-$_name
pkgver=0.31.1
pkgrel=1
pkgdesc='The little ASGI framework that shines'
arch=(any)
url="https://github.com/encode/starlette"
license=(BSD)
depends=(
  python
  python-anyio
  python-typing-extensions
)
makedepends=(
  python-build
  python-installer
  python-hatchling
  python-wheel
)
checkdepends=(
  python-aiosqlite
  python-databases
  python-pytest
  python-trio

  # optdepends
  python-itsdangerous
  python-jinja
  python-python-multipart
  python-pyyaml
  python-httpx

  # not specified,but required
  python-sqlalchemy
)
optdepends=(
  'python-exceptiongroup: for collapsing exceptions'
  'python-itsdangerous: for session middleware support'
  'python-jinja: for jinja templates'
  'python-python-multipart: for form parsing'
  'python-pyyaml: for schema generator'
  'python-httpx: for test client'
)
source=($_name-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('8501b1f40fea9351eba8366dfe1adcb27d19a64a2f547153f3106f8d6828a47c850d6ffb634d6ce60e74fc02d510afda22bca33e07631b72f9a5558e977ea0f6')
b2sums=('08ebe13d4b9716c6ff74a4f9ca6333f5e6dc31c6ce359b39cbf8e9822fad2e8c8a111788a37893ad687f4d3ffb3bef1e21146f3769b3ac07f083b1c454c07fa3')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv -o 'markers=filterwarnings' -p no:warnings
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
