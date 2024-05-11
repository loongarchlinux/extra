# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Co-Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=lxqt-themes
pkgver=2.0.0
pkgrel=1
pkgdesc="LXQt themes, graphics and icons."
arch=("any")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
license=("LGPL2.1")
depends=("hicolor-icon-theme")
makedepends=("lxqt-build-tools")
replaces=("lxqt-common")
source=(
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz.asc"
)
sha256sums=('927aa0bd8ecf718c4a91e820277af12a24d329b99e9e7ca4868311c1de76911d'
            'SKIP')
validpgpkeys=(
	"169704C6FB490C6892C7F23C37E0AF1FDA48F373"  # Jerome Leclanche <jerome@leclan.ch>
	"7C733BA5F585AAD669E4D23A42C9C8D3AF5EA5E3"  # Alf Gaida <agaida@siduction.org>
	"19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # Pedram Pourang <tsujan2000@gmail.com>
)


build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
