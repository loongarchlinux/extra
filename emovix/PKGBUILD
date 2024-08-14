# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=emovix
pkgver=0.9.0
pkgrel=9
pkgdesc="Tools to create Movix-CD's"
arch=(any)
url='http://movix.sourceforge.net/'
license=(GPL-2.0-or-later)
depends=(cdrkit
         perl
         sh)
source=(https://downloads.sourceforge.net/sourceforge/movix/$pkgname-$pkgver.tar.gz)
sha256sums=('96b84843ed80d31df5c07f6ee972362f7a0629a9b181afeb4a99b2127c07ff57')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  find "$pkgdir"/usr/share/emovix -type d -exec chmod 755 {} \;
}
