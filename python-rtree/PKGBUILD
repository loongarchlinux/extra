# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-rtree
pkgver=1.1.0
pkgrel=3
pkgdesc="Rtree: spatial index for Python GIS"
url="https://rtree.readthedocs.io/en/latest/"
license=('MIT')
arch=('any')
depends=('python' 'spatialindex')
makedepends=('python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-numpy')
source=("https://github.com/Toblerity/rtree/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('97a87027e49520f12cb86444ee8a9795fabeec6d8f0e3e869f2714df8f7c649ced1374385852af0ce7d7eb91e5a2cb464a4330807be15d538dc0a4d8de7b7ca2')

build() {
  cd rtree-$pkgver
  python setup.py build
}

check() {
  cd rtree-$pkgver
  pytest
}

package() {
  cd rtree-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm 0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
