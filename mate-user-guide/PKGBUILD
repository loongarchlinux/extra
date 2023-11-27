# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-user-guide
pkgver=1.26.2
pkgrel=1
pkgdesc="MATE User Guide"
groups=('mate')
url="https://mate-desktop.org"
arch=('any')
license=('FDL')
depends=('yelp' 'gettext')
makedepends=('itstool')
source=("https://pub.mate-desktop.org/releases/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('4d32b6e3564ac8f4eaab2b15482df7f9769750df8811abed837d0a2e7ee3808b')

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
