# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_name=starlette
pkgname=python-$_name
pkgver=0.33.0
pkgrel=1
pkgdesc='The little ASGI framework that shines'
arch=(any)
url="https://github.com/encode/starlette"
license=(BSD-3-Clause)
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
sha512sums=('4ebf75b76656a23599e45b839451af13261ac893efd4dcb3fb1a23de79e9779e8a1e007e3f8d755228f8348aa3e7d821e885774a8fd04a1efac45776cf00790f')
b2sums=('64bf929409be913bd193d0a929c7ab158383ea69a31a98833f425d68f308a1459998af89b631c6db34a32ef599e10fa0dd11c07c7d74e90de2ff10d2a7378a46')

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
