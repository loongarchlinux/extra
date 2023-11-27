# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=torbrowser-launcher
pkgver=0.3.6
pkgrel=3
pkgdesc="Securely and easily download, verify, install, and launch Tor Browser in Linux"
url="https://github.com/torproject/torbrowser-launcher"
depends=(
  'dbus-glib'
  'gnupg'
  'hicolor-icon-theme'
  'python'
  'python-gpgme'
  'python-packaging'
  'python-pyqt5'
  'python-pysocks'
  'python-requests'
  'tor'
)
makedepends=(
  'python-build'
  'python-distro'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=('apparmor: support for apparmor profiles')
arch=('any')
license=('MIT')
backup=(
  'etc/apparmor.d/local/torbrowser.Browser.firefox'
  'etc/apparmor.d/local/torbrowser.Tor.tor'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/torproject/torbrowser-launcher/archive/v${pkgver}.tar.gz"
        1a0562ba2f8e3a1b56c027a71514bbb30e3cecc1.patch
        27cb52b5cc5840a1a13d8d37910d99882f9f4738.patch
        pyproject.toml)
sha256sums=('39db8bd936502bc6d9adf3a628fba13a728c7b1aa2b5bac148454c8718863654'
            'b8edd9cbff3f235c2eafd917a342b088da639741c61eea4c8f237fef1506dc35'
            'a6d9a1f19146878104506acbf024794321e7196ea38e60175f7a62d693d5a1f1'
            '11557fc869021485aeba1dd31c06405ea0fbe2290d18de21324fc6f9fcaa7922')
b2sums=('32ec935d80f254fa069e57876e84bb108a5ca09d68c7f0e747228157de5166fc5e2106e6a544faf656c202f90fa0d5a051bdeaf4b398c24b7e17fbf5b9ba4543'
        '2e14182f944f4e8f8bad91312a0dbef0d39d8acfe3fba6fd24f59249e91d1e5d4dbabe9a8c6f4ddfcca4c712088063159e57e51102e7d2ca75fdab969659a52a'
        '830b9aa2de30fc6b6fc420383c96add78b3c1819fcfb7859f933990188d267e3926030f235c3a18808bf6d0afef426671e15d240c7cc8c436f3d77fdbcbcbaca'
        '2fe6e2efed71aaf1f976578fbb1b8f523705a3e1bf0409872c6f8e9e3846ff3c87f62cde82f16b49b2098b3d92eb48c80c5acadc754d8420cf0ca56a69b9cb98')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../1a0562ba2f8e3a1b56c027a71514bbb30e3cecc1.patch
  patch -Np1 -i ../27cb52b5cc5840a1a13d8d37910d99882f9f4738.patch

  [ ! -e pyproject.toml ] # remove our pyproject.toml if upstream already has one
  cp ../pyproject.toml .
}

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd ${pkgname}-${pkgver}
  python -m installer --destdir=test_dir dist/*.whl

  PATH="test_dir/usr/bin:$PATH" PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" torbrowser-launcher --help
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -d "${pkgdir}/etc/apparmor.d"
  cp -a apparmor/* "${pkgdir}/etc/apparmor.d"
  rm "${pkgdir}/etc/apparmor.d/license.txt"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 apparmor/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.apparmor.txt"
}

# vim:set ts=2 sw=2 et:
