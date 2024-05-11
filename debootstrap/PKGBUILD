# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=debootstrap
pkgver=1.0.134
pkgrel=2
pkgdesc="Bootstrap a basic Debian system"
arch=('any')
license=('GPL')
url="https://tracker.debian.org/pkg/debootstrap"
depends=('perl' 'wget' 'binutils')
source=(https://salsa.debian.org/installer-team/debootstrap/-/archive/$pkgver/debootstrap-$pkgver.tar.bz2
        arch-detect.patch)
optdepends=('gnupg: check release signatures'
            'debian-archive-keyring: check release signatures for Debian'
            'debian-ports-archive-keyring: check release signatures for Debian Ports'
            'ubuntu-keyring: check release signatures for Ubuntu')
sha512sums=('e7b9726632d3816975c8cbd0020882f69db6d2a84f6c2d086a4e002c58afa61f8b08a8a35b40dd6a284e2cdb584817292462e5dc354fb83d177d50a56aa8cda6'
            'b1fdff6142326c2a5075e457181a85cb2a37848c777f128f4c0eb3740980784d25d4f143a76b97c90ef252463cc5d8bd0797b2544c27b6dd8e05a6258a6b0c02')

prepare() {
  cd debootstrap-$pkgver

  sed -i 's/sbin/bin/g' Makefile

  # Debian defaults
  sed -i 's|export PATH|export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"|' debootstrap

  # Detect Architecture
  patch -p0 -i ../arch-detect.patch
}

package() {
  cd debootstrap-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 debootstrap.8 "$pkgdir"/usr/share/man/man8/debootstrap.8
}
