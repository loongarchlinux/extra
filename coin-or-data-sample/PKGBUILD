# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=coin-or-data-sample
pkgver=1.2.12
pkgrel=2
pkgdesc='COIN-OR Sample data'
arch=(any)
url='https://github.com/coin-or-tools/Data-Sample'
license=(EPL-1.0)
depends=()
makedepends=(git)
groups=(coin-or)
source=(git+https://github.com/coin-or-tools/Data-Sample#tag=releases/$pkgver)
sha256sums=('d447105b1e7b08fd5d4bc872150215e954510666cbc616b3acdfd48435463e11')

build() {
  cd Data-Sample
  ./configure --prefix=/usr
  make
}

package() {
  cd Data-Sample
  make DESTDIR="$pkgdir" install
}
