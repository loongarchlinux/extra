# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mozo
pkgver=1.28.0
pkgrel=2
pkgdesc="MATE menu editing tool"
url="https://mate-desktop.org"
arch=('any')
license=('GPL')
depends=('gtk3' 'python>=3.5' 'mate-menus' 'python-gobject' 'gettext' 'mate-panel')
groups=('mate-extra')
conflicts=('mozo-gtk3')
replaces=('mozo-gtk3')
source=("https://pub.mate-desktop.org/releases/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('fe98984ffd6aa8c36d0594bcefdba03de39b42d41e007251680384f3cef44924')

build() {
    	cd "${pkgname}-${pkgver}"
    	PYTHON=/usr/bin/python ./configure \
        	--prefix=/usr
    	make
}

package() {
    	cd "${pkgname}-${pkgver}"
    	make DESTDIR="${pkgdir}" install
}
