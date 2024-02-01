# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-dict2xml
pkgver=1.7.4
pkgrel=1
pkgdesc="Small utility to convert a python dictionary into an XML string"
arch=('any')
url="https://github.com/delfick/python-dict2xml"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-noseofyeti')
source=("https://github.com/delfick/python-dict2xml/archive/release-$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a16337774146a5c3acdd7930ca22bae139be184e78d0b3ee6982728c1737db1ad28dd4f7b8eccaeb5ab8b9e4a0a22a38c7d1e88c985a0186613a3b12880c5de7')

build() {
  cd python-dict2xml-release-$pkgver
  python -m build -nw
}

check() {
  cd python-dict2xml-release-$pkgver
  pytest
}

package() {
  cd python-dict2xml-release-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
