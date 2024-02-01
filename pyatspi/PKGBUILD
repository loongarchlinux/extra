# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=pyatspi
pkgname=(python-atspi)
pkgver=2.46.1
pkgrel=1
pkgdesc="Python bindings for D-Bus AT-SPI"
url="https://gitlab.gnome.org/GNOME/pyatspi2"
arch=(any)
license=(LGPL-2.0-only)
depends=(
  at-spi2-core
  python-gobject
)
makedepends=(git)
_commit=8c69016b38d0e4caaf4c986938ea3410fb7351b6  # tags/PYATSPI_2_46_1^0
source=("git+https://gitlab.gnome.org/GNOME/pyatspi2.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd pyatspi2
  git describe --tags | sed 's/^PYATSPI_//;s/_/./g;s/[^-]*-g/r&/;s/-/+/g'
}

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
