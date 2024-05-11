# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-jsondiff
_pkgname=jsondiff
pkgver=2.0.0
pkgrel=5
pkgdesc='Diff JSON and JSON-like structures in Python'
arch=(any)
url='https://github.com/xlwings/jsondiff'
license=(MIT)
depends=(python)
makedepends=(git python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-hypothesis)
source=("git+https://github.com/xlwings/jsondiff.git#tag=$pkgver")
sha256sums=('5f8ce672f038086ea71ffc0a89686c2ba0a484fa9b5814740a8e3ae66773e150')

prepare() {
  cd $_pkgname
  # Backport commits for nose -> pytest migration
  # https://github.com/xlwings/jsondiff/pull/52
  git cherry-pick -n 8ab2bb125007c540782d06f30076221ef811248b \
                     fc05b9d823eb6227ab15ad3294382ede63a970f2 \
                     82dfd88eccdc9ae620244c01651b7f3042761373
}

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
