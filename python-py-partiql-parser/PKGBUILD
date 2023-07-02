# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-py-partiql-parser
_pkgname=py-partiql-parser
# https://github.com/getmoto/py-partiql-parser/blob/main/CHANGELOG.md
# UPDATE_BLOCKED: moto pins a specific version
pkgver=0.3.3
pkgrel=1
pkgdesc='Python Parser for PartiQL'
arch=(any)
url='https://github.com/getmoto/py-partiql-parser'
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-sure)
source=("https://github.com/getmoto/py-partiql-parser/archive/refs/tags/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('45898bf00a05641b24fc6e998eef7ad5d24f7b861742a0e2a672b6ddc592a813')

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
