# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pydantic-extra-types
pkgname=python-pydantic-extra-types
pkgver=2.9.0
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
  python-pendulum
  python-phonenumbers
  python-pycountry
  python-pytest
  python-semver
  python-ulid
)
optdepends=(
  'python-pendulum: for datetime support'
  'python-phonenumbers: for phone number support'
  'python-pycountry: for country code support'
  'python-pytz: for timezone support'
  'python-semver: for semantic versioning support'
  'python-tzdata: for timezone support'
  'python-ulid: for ULID support'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('8697085069437aeacb34d6dee27b9b8c669dfd0009b11fdda37c6259de9d51776c4d75187c45a6f576b9cf1ed57d4e8e045689f577ed77ce49cc5a66894c20c9')
b2sums=('12454ad3a34e14550fac0389d4f52d37720df8cc5801ac5b3e932eb7faddf178f43ccfcf20f66a511db552133158df9148333745eb580c9e90586d86a2400d8e')

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
