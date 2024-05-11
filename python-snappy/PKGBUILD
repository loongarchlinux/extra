# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-snappy
pkgver=0.7.1
pkgrel=1
pkgdesc='Python bindings for the snappy compression library.'
url='https://github.com/intake/python-snappy'
depends=(python python-cramjam)
makedepends=(git python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
# https://github.com/intake/python-snappy/blob/0.7.1/LICENSE
license=('BSD-3-Clause')
arch=(any)
source=("git+https://github.com/intake/python-snappy#tag=$pkgver")
sha256sums=('ee39c2cab15dde409732c3d262d628c32c4038cfed0664ae8f0f1dcec0cfe315')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  PYTHONPATH="$PWD/src" pytest
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
