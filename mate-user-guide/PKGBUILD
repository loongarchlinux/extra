# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-user-guide
pkgver=1.28.0
pkgrel=1
pkgdesc="MATE User Guide"
groups=('mate')
url="https://mate-desktop.org"
arch=('any')
license=('FDL')
depends=('yelp' 'gettext')
makedepends=('itstool')
source=("https://pub.mate-desktop.org/releases/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('53ef0814f506544614ed61ab7be5221cc8d3a9f14f7ef9698c90fe7e46014b9e')

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
