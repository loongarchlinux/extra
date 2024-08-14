# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-jsondiff
_pkgname=jsondiff
pkgver=2.2.0
pkgrel=1
pkgdesc='Diff JSON and JSON-like structures in Python'
arch=(any)
url='https://github.com/xlwings/jsondiff'
license=(MIT)
depends=(python python-yaml)
makedepends=(git python-build python-installer python-setuptools python-wheel python-setuptools-scm)
checkdepends=(python-pytest python-hypothesis)
source=("git+https://github.com/xlwings/jsondiff.git#tag=$pkgver")
sha256sums=('b178ab7b912004730d32e9645f432a6baf5654ba4c2d09f0dc3b7ffa7a5e6e91')

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname
  pytest -v tests
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
