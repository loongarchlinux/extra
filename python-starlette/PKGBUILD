# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_name=starlette
pkgname=python-$_name
pkgver=0.28.0
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
  'python-itsdangerous: for session middleware support'
  'python-jinja: for jinja templates'
  'python-python-multipart: for form parsing'
  'python-pyyaml: for schema generator'
  'python-httpx: for test client'
)
source=($_name-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('344c0581e6d6e64abd51347757cba4eb9bfba6f66bf62a2a5491cd3bb1c332895d6827bc478c00d9dfe3043152e814b6870894577a4e9547ac116c66f75a49b1')
b2sums=('a3cb35cf465b4540457cffafe4a3bb32081f542b8a5c730bc7fcc0bbf9f7a6c2c21bcc4297c8f3c5281f6ca787aa03c3ee4f90032155d1aa1887440dc289e5c1')

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
