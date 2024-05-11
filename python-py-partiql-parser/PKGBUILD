# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-py-partiql-parser
_pkgname=py-partiql-parser
# https://github.com/getmoto/py-partiql-parser/blob/main/CHANGELOG.md
# UPDATE_BLOCKED: blocked along with python-moto
pkgver=0.5.0
pkgrel=2
pkgdesc='Python Parser for PartiQL'
arch=(any)
url='https://github.com/getmoto/py-partiql-parser'
# Most files are licensed under MIT, while an Apache 2.0 file is vendored since 0.4.0.
# See: https://github.com/getmoto/py-partiql-parser/pull/12
license=(MIT Apache)
# Switch to SPDX when namcap supports it
#license=('MIT AND Apache-2.0')
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=("https://github.com/getmoto/py-partiql-parser/archive/refs/tags/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e9dade1734d7ee48177960d0db2d751b7d3260ffd5882c1a92be441e9b0d35b2')

build() {
  cd $_pkgname-$pkgver

  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver

  pytest tests
}

package() {
  cd $_pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
