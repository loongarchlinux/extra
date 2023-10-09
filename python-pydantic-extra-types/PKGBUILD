# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pydantic-extra-types
pkgname=python-pydantic-extra-types
pkgver=2.1.0
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
)
optdepends=(
  'python-phonenumbers: for phone number support'
  'python-pycountry: for country code support'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('f1d6ad8940f2c8a686cce9083a136b282d37afb6b465c37b4a326fb21f8601f7b2a3d672764fd84c6ef47c2ec7092f8506c799a362744d77ca72b8b76e9a78bc')
b2sums=('90023c8d8e64b09289db6c025df5e332217357d2c2a7a1eb171e5bfd40a8f59dca404890a0b06367cd87543e7f5812bc0e4c59841a2f8ea510f3c4ca32aad1a6')

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
