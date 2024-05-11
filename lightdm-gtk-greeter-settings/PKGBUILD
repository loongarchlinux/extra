# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Arthur Zamarin <arthurzam@gmail.com>
# Contributor: andrew.p <pan.pav.7c5@gmail.com>

pkgname=lightdm-gtk-greeter-settings
pkgver=1.2.3
pkgrel=2
pkgdesc='Settings editor for the LightDM GTK+ Greeter'
arch=(any)
url=https://github.com/xubuntu/lightdm-gtk-greeter-settings
license=(GPL3)
depends=(
  bash
  gdk-pixbuf2
  glib2
  gtk-update-icon-cache
  gtk3
  lightdm-gtk-greeter
  pango
  python
  python-gobject
)
makedepends=(
  git
  python-distutils-extra
)
_tag=7e429dfd544b499514fea284f0ae60c2fd7748ed
source=(git+https://github.com/Xubuntu/lightdm-gtk-greeter-settings.git#tag=${_tag})
b2sums=(SKIP)

pkgver() {
  cd lightdm-gtk-greeter-settings
  git describe --tags | sed 's/^lightdm-gtk-greeter-settings-//'
}

build() {
  cd lightdm-gtk-greeter-settings
  python setup.py build
}

package() {
  cd lightdm-gtk-greeter-settings
  python setup.py install --root="${pkgdir}" --optimize=1 --xfce-integration
}

# vim: ts=2 sw=2 et:
