# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=gufw
pkgver=24.04
pkgrel=2
pkgdesc='Uncomplicated way to manage your Linux firewall'
url='https://gufw.org/'
arch=('any')
license=('GPL3')
depends=('gtk3' 'polkit' 'python' 'python-gobject' 'ufw' 'webkit2gtk'
         'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=('intltool' 'python-distutils-extra' 'python-setuptools')
source=(https://github.com/costales/gufw/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('c9b9d86c35ab574e6e93f3dc62fc1875c33b371c397ab7032e07935db7d594c7e0af37789678007b848ff83a5d1d69724c728687c0c36a4c890aaf56420c2228')
b2sums=('0ca73eb49a0b640370c7a5053359d44d4476a9919d7e4a8d15c7950fd92a5dc508c4664c4bc1401f210ced2e999c923132ca5128ae4a5f68f634eb0b614f02f3')

prepare () {
  cd ${pkgname}-${pkgver}
  local PYTHONVERSION="$(python -c 'import sys; print("{}.{}".format(sys.version_info.major, sys.version_info.minor))')"
  sed 's|/usr/share/gufw/gufw/gufw.py $1|/usr/lib/python'"${PYTHONVERSION}"'/site-packages/gufw/gufw.py "$@"|' -i bin/gufw-pkexec
}

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  # required so desktop, icon and translation files get installed
  export XDG_RUNTIME_DIR="$(mktemp -d --tmpdir gufw-build-XXXXXXXXX)"
  python setup.py install --prefix=/usr --root="${pkgdir}" -O1
}

# vim: ts=2 sw=2 et:
