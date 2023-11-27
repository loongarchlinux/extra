# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-py-partiql-parser
_pkgname=py-partiql-parser
# https://github.com/getmoto/py-partiql-parser/blob/main/CHANGELOG.md
# UPDATE_BLOCKED: moto pins a specific version https://github.com/getmoto/moto/blob/master/setup.cfg
pkgver=0.4.2
pkgrel=1
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
sha256sums=('5d7531f31f5508880ad4e29eb85d6901185cf999c48c2bc7b18e06cb27f8bfd3')

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
