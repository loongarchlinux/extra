# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pydantic-extra-types
pkgname=python-pydantic-extra-types
pkgver=2.4.1
pkgrel=1
pkgdesc="Extra pydantic types"
arch=(any)
url="https://github.com/pydantic/pydantic-extra-types"
license=(MIT)
depends=(
  python
  python-pydantic
  python-pydantic-core
)
makedepends=(
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  python-dirty-equals
  python-phonenumbers
  python-pycountry
  python-pytest
  python-ulid
)
optdepends=(
  'python-phonenumbers: for phone number support'
  'python-pycountry: for country code support'
  'python-ulid: for ULID support'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('4ce77cc6b1ff6b76c95472e70440ce4f7d91fba45471c184c26d1d675ee024b561abd8ea2220a2f5e21d1fe0d47d64fd5088f74e8668af012ea1bb5727499851')
b2sums=('2a6142e5015c2284a651d706747b3fa487a0c789965583047b9bc4370d1ea119f883e043d8a948cd636517c7c1c495463ab33a5831d726c924854e5d75937ee7')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
