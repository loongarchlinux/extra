# Maintainer: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-backgrounds
pkgver=1.28.0
pkgrel=1
pkgdesc="Background images and data for MATE"
url="https://mate-desktop.org"
arch=('any')
license=('GPL')
groups=('mate')
depends=('gettext')
source=("https://pub.mate-desktop.org/releases/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('50d1afd02486bd07ac22a5a6b6efa3031148f0d48a82e488d909ad57003a6943')

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
