# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-parse-type
pkgver=0.6.2
pkgrel=2
pkgdesc="Simplifies to build parse types based on the parse module"
url="https://github.com/jenisys/parse_type"
license=('MIT')
arch=('any')
depends=('python-parse' 'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-html')
source=("https://github.com/jenisys/parse_type/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('6fe55d97b7f875e21c5c4192affa64be3155e821dcec5b8688eef2b20b1f9ab7836f80927330662c0f2eda4cab0b9907e0b258001aecb80a8796610b18ded1b5')

build() {
  cd parse_type-$pkgver
  python -m build -nw
}

check() {
  cd parse_type-$pkgver
  pytest
}

package() {
  cd parse_type-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
