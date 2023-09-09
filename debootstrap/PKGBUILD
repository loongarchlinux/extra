# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=debootstrap
pkgver=1.0.131
pkgrel=1
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
sha512sums=('a7113392bbc0ed18f5208f535baa23691c4a2ec326dc8970d812ca1017fb4c86f61943541d1b77bff6cbb8d40277e5cd155759f7f86d583c09c47df9a0e625ba'
            'd70a9d096d1692f71970cc818515bd783a6031bfe2d2857134eabf6fd36e4137152ebafa8e2d4ae7c8cb442c8532cd4192715b286e38b4d947b0b467e9ed54a5')

prepare() {
  cd debootstrap-$pkgver

  sed -i 's/sbin/bin/g' Makefile

  # Debian defaults
  sed -i 's|export PATH|export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"|' debootstrap

  # Detect Architecture
  patch -p1 -i ../arch-detect.patch
}

package() {
  cd debootstrap-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 debootstrap.8 "$pkgdir"/usr/share/man/man8/debootstrap.8
}
