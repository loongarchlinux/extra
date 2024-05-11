# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-icon-theme
pkgver=1.28.0
pkgrel=1
pkgdesc="MATE icon theme"
url="https://mate-desktop.org"
arch=('any')
license=('LGPL')
options=('!emptydirs')
depends=('gettext')
makedepends=('icon-naming-utils')
groups=('mate')
source=("https://pub.mate-desktop.org/releases/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('94d6079060ca5df74542921de4eea38b7d02d07561c919356d95de876f9a6d3a')

build() {
   	cd "${pkgname}-${pkgver}"
    	./configure \
        	--prefix=/usr
    	make
}

package() {
    	cd "${pkgname}-${pkgver}"
    	make DESTDIR="${pkgdir}" install
}
