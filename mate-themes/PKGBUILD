# Maintainer:  Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-themes
pkgver=3.22.24
pkgrel=1
pkgdesc="Default themes for the MATE desktop"
url="http://mate-desktop.org"
arch=('any')
license=('GPL')
makedepends=('gtk2' 'intltool')
optdepends=('gtk-engines: for gtk2 themes'
            'gtk-engine-murrine: for gtk2 themes'
            'mate-icon-theme: default icon theme')
options=('!emptydirs')
groups=('mate')
source=("https://pub.mate-desktop.org/releases/themes/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('3d8b3a2a285331de24c4cf5d8c9dd846daa11695f206765d8f1693ebcacf6e4a')

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
