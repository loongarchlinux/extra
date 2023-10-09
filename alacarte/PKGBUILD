# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: pressh <pressh@gmail.com>

pkgname=alacarte
pkgver=3.50.0
pkgrel=1
epoch=1
pkgdesc="Menu editor for gnome"
url="https://gitlab.gnome.org/GNOME/alacarte"
arch=(any)
license=(LGPL)
depends=(
  gnome-menus
  gtk3
  python-cairo
  python-gobject
)
makedepends=(
  docbook-xsl
  git
  libxslt
)
_commit=167780e0e9fc5cb26ccd3e5d55e33b32ae15ea44  # tags/3.50.0^0
source=("git+https://gitlab.gnome.org/GNOME/alacarte.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd alacarte
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd alacarte
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
  )

  cd alacarte
  ./configure "${configure_options[@]}"
  make
}

package() {
  cd alacarte
  make DESTDIR="$pkgdir" install

  python -m compileall -d /usr "$pkgdir/usr"
  python -O -m compileall -d /usr "$pkgdir/usr"
}

# vim:set sw=2 sts=-1 et:
