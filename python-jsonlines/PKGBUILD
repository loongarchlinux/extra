# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-jsonlines
pkgver=4.0.0
pkgrel=2
pkgdesc="Library with helpers for the jsonlines file format"
url="https://github.com/wbolster/jsonlines"
license=('BSD')
arch=('any')
depends=('python-attrs')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/wbolster/jsonlines/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('d197163b4875dd5d30afdd8e5b9415d8faa3af2787bbecbc7a7f79aa28e775b2e119bffdf61699e132552af19ff97d6412fe83d328e4022acd920456addeb275')

build() {
  cd jsonlines-$pkgver
  python setup.py build
}

check() {
  cd jsonlines-$pkgver
  python -m pytest
}

package() {
  cd jsonlines-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.rst -t "$pkgdir"/usr/share/licenses/$pkgname/
}
