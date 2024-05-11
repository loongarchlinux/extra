# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jörg Thalheim <joerg@higgsboson.tk>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Wieland Hoffmann <the_mineo@web.de>
# Contributor: stonecrest <stonecrest[at]gmail[dot]com>

pkgname=python-mpd2
pkgver=3.1.1
pkgrel=2
pkgdesc='Python library which provides a client interface for the Music Player Daemon'
url=https://github.com/Mic92/python-mpd2
license=(GPL3)
depends=(python)
makedepends=(
  git
  python-setuptools
)
arch=(any)
_tag=cc826d634f7bf7a5535cf411bd8b16c75f6a4fea
source=(git+https://github.com/Mic92/python-mpd2.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd python-mpd2

  git describe --tags | sed 's/^v//'
}

build() {
  cd python-mpd2

  python setup.py build
}

package() {
  cd python-mpd2

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: ts=2 sw=2 et:
