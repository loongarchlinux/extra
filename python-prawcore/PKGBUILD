# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-prawcore
pkgver=2.4.0
pkgrel=2
pkgdesc="Low-level communication layer for PRAW 4+."
arch=('any')
license=('BSD')
url="https://github.com/praw-dev/prawcore"
depends=('python-requests')
makedepends=('python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-betamax' 'python-pytest' 'python-urllib3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/praw-dev/prawcore/archive/v$pkgver.tar.gz")
sha512sums=('6b7464e80d612de9e9cf118fa21abcca61d160150a422175353895efe89757a3e4d417122af2956c0b5aebc59de855866ea4db6af5162c8ad9ec66971edab80c')

build() {
  cd prawcore-$pkgver
  python -m build -nw
}

check() {
  cd prawcore-$pkgver
  pytest
}

package() {
  cd prawcore-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
