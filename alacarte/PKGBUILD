# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: pressh <pressh@gmail.com>

pkgname=alacarte
pkgver=3.52.0
pkgrel=2
epoch=1
pkgdesc="Menu editor for gnome"
url="https://gitlab.gnome.org/GNOME/alacarte"
arch=(any)
license=(LGPL-2.0-or-later)
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
_commit=f2f3f859b8f4455d061172dd354a075f997a4a9e  # tags/3.52.0^0
source=("git+https://gitlab.gnome.org/GNOME/alacarte.git#commit=$_commit")
b2sums=('b2b0e05e8c800129985e956f77c412fdcb04471fc96dd1f08919a4300324f539d20f1ac0a6efb04a528723f8b02d1427f74fe48405b3d977e71e9235bf5dc8e9')

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
