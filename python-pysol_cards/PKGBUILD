# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=pysol_cards
pkgname=python-$_pyname
pkgver=0.16.0
pkgrel=2
pkgdesc='Deal PySol FC Cards'
arch=(any)
url='https://pypi.org/project/pysol-cards/'
license=(MIT)
depends=(python
         python-random2
         python-six)
makedepends=(python-build
             python-installer
             python-setuptools
             python-wheel)
source=(https://pypi.io/packages/source/p/$_pyname/$_pyname-$pkgver.tar.gz)
sha256sums=('0b87ca7b3f99155cccd3cfd739f739f7744d6f8198222c6d493a034a3d4570c3')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
