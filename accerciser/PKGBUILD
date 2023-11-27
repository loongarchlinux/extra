# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: Giulio Bai <giulio@hewle.com>

pkgname=accerciser
pkgver=3.42.0
pkgrel=1
pkgdesc="Interactive Python accessibility explorer for the GNOME desktop"
url="https://wiki.gnome.org/Apps/Accerciser"
arch=(any)
license=(BSD)
depends=(
  gtk3
  ipython
  libwnck3
  python
  python-atspi
  python-cairo
)
makedepends=(
  appstream-glib
  git
  yelp-tools
)
groups=(gnome-extra)
_commit=e36f30841dd85faff6ff5156f6c15fecbbf020ca  # tags/3.42.0^0
source=("git+https://gitlab.gnome.org/GNOME/accerciser.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --disable-schemas-compile
  )

  cd $pkgname
  ./configure "${configure_options[@]}"
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}

# vim:set sw=2 sts=-1 et:
