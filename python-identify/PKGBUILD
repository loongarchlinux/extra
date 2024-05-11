# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=identify
pkgname=python-identify
pkgver=2.5.35
pkgrel=3
pkgdesc="File identification library for Python"
arch=(any)
url="https://github.com/pre-commit/identify"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-ukkonen
)
optdepends=(
  'python-ukkonen: for returning license identifiers'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('1d01535f95818533220c06988eb2d9f495c004b41fd197482ab0e3520f81ab2aebce0344dffeb0449423abd6574c21043fa0ad20472b3aaff6cb97986f31fd88')
b2sums=('931169744a9126d82b32bd4dea1731f1f4ad209b78d3df9ce490891994194797a7adcaff19400e9856716528f5b3490e05c8e06614c788b089251ef92cd1dd03')

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
