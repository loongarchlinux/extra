# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: kitsunyan <kitsunyan@inbox.ru>
# Contributor: Grigorii Horos <horosgrisa@gmail.com>

pkgname=papirus-icon-theme
pkgver=20231101
pkgrel=1
pkgdesc="Papirus icon theme"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme"
license=("GPL3")
depends=('gtk-update-icon-cache')
source=("https://github.com/PapirusDevelopmentTeam/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ad1ea7ec1376cc3c964278d13f7159ebf8797b27923d2339b98f00eb68e5e604b6958394a0296ae1088d77793c69b35b8eb19e8d77654095327a4bde03d5b3c5')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
