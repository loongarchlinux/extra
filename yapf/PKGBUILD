# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=yapf
pkgver=0.40.1
pkgrel=1
pkgdesc="Python style guide checker"
arch=('any')
url="https://github.com/google/yapf"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-importlib-metadata')
source=("https://github.com/google/yapf/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('7d44ea8976c93db850f0a139535962e166b4e488e47761720747686061ad7d7d3bbb2771f2e1519b7db8af630f64b7bcf71143faa56d448c9d098c2d151bffeb')

build() {
  cd yapf-$pkgver
  python setup.py build
}

# TODO: add yapf_third-party as dep
#check() {
#  cd yapf-$pkgver
#  nosetests3
#}

package() {
  cd yapf-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
