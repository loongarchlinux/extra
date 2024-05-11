# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gajim
pkgver=1.8.4
pkgrel=3
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
            'python-gnupg: encrypting chat messages with OpenPGP'
            'emoji-font: for emojis support')
source=(https://www.gajim.org/downloads/${pkgver%.*}/gajim-${pkgver}.tar.gz
        disable-failing-test.patch)
sha512sums=('1a5b028c0e308eb15417c8c11584bc0e8b0218fead5155093ede4bc3961b6bee2b47bc3510f751dc70194634d6ca94d4a675f6891c8f050859fb4729020e52cb'
            '6244bf8738baf57e391140a7df7f270394b05055ebdf57acd5f30ffd0afec542ccd4348e59a7c64a1ecfb7b7d29ef21e2f823ea765a5281eba63692b9ab488f3')
b2sums=('e23eafe707bc482a050fcef44df9e68af552444cce173c506538ebe01557a894dc0ba8b9afe18f195fd0b00b717b1268531a960b1c8b868c22081135d14e3079'
        '4bcc5859ea58bee9fabb2888172aed80bfe240bc5888c9795e382ddc511b51b7f0f5b63e6c207370e182ed41bc08242f8f38574dddf26803c30fda465924870c')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../disable-failing-test.patch # Disable test that fails with pango 1.52.2
}

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
