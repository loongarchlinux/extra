# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=pyatspi
pkgname=(python-atspi)
pkgver=2.46.1
pkgrel=2
pkgdesc="Python bindings for D-Bus AT-SPI"
url="https://gitlab.gnome.org/GNOME/pyatspi2"
arch=(any)
license=(LGPL-2.0-only)
depends=(
  at-spi2-core
  python-gobject
)
makedepends=(git)
source=("git+https://gitlab.gnome.org/GNOME/pyatspi2.git#tag=PYATSPI_${pkgver//./_}")
b2sums=('be2d581223a2994def5e0e650166245258da157e5b6708b97f2ac4896f12070dc2af77562d14bc07849c3cc0c9ae92427914cc7c72b7331686798c4108ed791a')

prepare() {
  cd pyatspi2
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --with-python=/usr/bin/python
  )

  cd pyatspi2
  ./configure "${configure_options[@]}"
  make
}

package_python-atspi() {
  cd pyatspi2
  make DESTDIR="$pkgdir" install
}

# vim:set sw=2 sts=-1 et:
