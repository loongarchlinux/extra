# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: kitsunyan <kitsunyan@inbox.ru>
# Contributor: Grigorii Horos <horosgrisa@gmail.com>

pkgname=papirus-icon-theme
pkgver=20230901
pkgrel=1
pkgdesc="Papirus icon theme"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme"
license=("GPL3")
depends=('gtk-update-icon-cache')
source=("https://github.com/PapirusDevelopmentTeam/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ba7a563dfff6080f79d23b00d4c5c421321ac9a911deeecf40cd2a16f1d2ee6642c07c944c6f306fa1fc34eac83ec634eac0e613bc16f709359977e2b1c82fd7')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
