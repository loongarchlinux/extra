# Maintainer: Fabian Bornschein <fabiscafe-at-mailbox-dot-org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=orca
pkgver=45.1
pkgrel=1
pkgdesc="Screen reader for individuals who are blind or visually impaired"
url="https://wiki.gnome.org/Projects/Orca"
arch=(any)
license=(LGPL)
depends=(
  at-spi2-core
  brltty
  gobject-introspection-runtime
  gsettings-desktop-schemas
  gstreamer
  gst-plugins-base # playbin, audiotestsrc, basic decoders
  gst-plugins-good # pulsesink, more decoders
  gtk3
  hicolor-icon-theme
  liblouis
  libwnck3
  pango
  python
  python-atspi
  python-cairo
  python-gobject
  python-setproctitle
  speech-dispatcher
  xorg-xkbcomp
  xorg-xmodmap
)
makedepends=(
  git
  itstool
  yelp-tools
)
groups=(gnome)
_commit=9e77d1baf9bd24b78d7499ad9b2e8bb80c9a0c81  # tags/ORCA_45_1^0
source=("git+https://gitlab.gnome.org/GNOME/orca.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd orca
  git describe --tags | sed 's/ORCA_//;s/_/\./g;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd orca
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd orca
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd orca
  make DESTDIR="$pkgdir" install
}

# vim:set sw=2 sts=-1 et:
