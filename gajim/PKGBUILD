# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gajim
pkgver=1.8.1
pkgrel=1
pkgdesc='Full featured and easy to use XMPP (Jabber) client'
url='https://gajim.org/'
arch=('any')
license=('GPL3')
depends=('gtk3' 'gtksourceview4' 'python-cairo' 'python-gobject' 'python-keyring' 'python-nbxmpp>=4.3.0' 'python-cryptography' 'python-precis_i18n' 'python-css-parser' 'python-distro' 'hicolor-icon-theme' 'python-pillow' 'python-gssapi' 'python-netifaces' 'python-qrcode' 'python-omemo-dr' 'python-packaging' 'pango' 'sqlite')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-dbus: to have gajim-remote working'
            'python-sentry_sdk: for Sentry error reporting to dev.gajim.org (users decide whether to send reports or not)'
            'gspell: for spell checking support'
            'libsecret: for GNOME Keyring or KDE support as password storage'
            'gupnp-igd: for better NAT traversing'
            'networkmanager: for network lose detection'
            'geoclue2: share current location'
            'gsound: Notification Sounds'
            'libayatana-appindicator: for App Indicator on Wayland'
            'farstream: for video and audio calls'
            'gstreamer: for video and audio calls'
            'gst-plugins-base: for video and audio calls'
            'gst-plugins-ugly: for video and audio calls'
            'gst-libav: for video and audio calls'
            'libxss: for idle time checking on X11'
            'python-gnupg: encrypting chat messages with OpenPGP')
source=(https://www.gajim.org/downloads/${pkgver%.*}/gajim-${pkgver}.tar.gz)
sha512sums=('b417d76a4225f16730441dee7befacd6db5be782c9271b789d5f9c10232e342f2d46930eef79a58839c13b2887926591d953a87a7544e32c7bf80d2c65390e31')
b2sums=('b7bbd751a051cd2a46e814a9b3ebc08f10a6570dc071752838a2463019cdf6ea4198f2a349f3935c33d988cd6908cf31dba572bac31f9363675433328e6d679b')

build() {
  cd ${pkgname}-${pkgver}
  ./pep517build/build_metadata.py -o dist/metadata
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  python -m unittest discover -s test
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  ./pep517build/install_metadata.py dist/metadata --prefix="${pkgdir}/usr"
}

# vim: ts=2 sw=2 et:
