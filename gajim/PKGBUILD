# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gajim
pkgver=1.8.3
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
            'gst-plugin-gtk: for video and audio calls'
            'libxss: for idle time checking on X11'
            'python-gnupg: encrypting chat messages with OpenPGP')
source=(https://www.gajim.org/downloads/${pkgver%.*}/gajim-${pkgver}.tar.gz)
sha512sums=('39ef1fe93bd2416cc7c9328289f4cf467aceb2a770e11f84b249965687e60668221a95a3c5f617e228f29aab99dad8775647ef7972f6a0d2075b5b7fcb169b70')
b2sums=('6d5b85f5ae403136755b1f9b11924f211ebb33fbe50040096e2bf0c7306d83d0abc594c8337b26f26168477a4dc2247dd1ac86c7ae2cd0fabbfb0639452480c4')

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
