# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-rtree
pkgver=1.2.0
pkgrel=1
pkgdesc="Rtree: spatial index for Python GIS"
url="https://rtree.readthedocs.io/en/latest/"
license=('MIT')
arch=('any')
depends=('python' 'spatialindex')
makedepends=('python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-numpy')
source=("https://github.com/Toblerity/rtree/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ab0ff77aad2dd7901c0997fd6d3673edda88539257a06564f6cd1d358aa29b19d269c1cb05db99cd06764ff7ea7209989996f87f9cfd43e4d04770e0be40c0eb')

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
