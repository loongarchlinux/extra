# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: kitsunyan <kitsunyan@inbox.ru>
# Contributor: Grigorii Horos <horosgrisa@gmail.com>

pkgname=papirus-icon-theme
pkgver=20230601
pkgrel=1
pkgdesc="Papirus icon theme"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme"
license=("GPL3")
depends=('gtk-update-icon-cache')
source=("https://github.com/PapirusDevelopmentTeam/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('cc14b4b2818998f2db622e30dbe5fbd69402a5fa7bbee08fdd4bc6e230fc93f16d683ebf0261794f7310b154b67f213f5af73d9828812bbaa810e5265955098c')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
