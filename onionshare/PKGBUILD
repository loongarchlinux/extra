# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Kevin Azzam <aur at kevin.azz.am>
# Contributor: Ye Shu <shuye02 at outlook.com>

pkgname=onionshare
pkgver=2.6.2
pkgrel=2
pkgdesc='Share a file over Tor Hidden Services anonymously and securely'
url='https://github.com/onionshare/onionshare'
arch=('any')
license=('GPL-3.0-only')
depends=(
  'hicolor-icon-theme'
  'pyside6'
  'python'
  'python-colorama'
  'python-flask'
  'python-flask-compress'
  'python-flask-socketio'
  'python-packaging'
  'python-psutil'
  'python-pynacl'
  'python-pysocks'
  'python-qrcode'
  'python-requests'
  'python-setuptools'
  'python-unidecode'
  'python-waitress'
  'python-werkzeug'
  'stem'
  'tor'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry'
  'python-wheel'
)
optdepends=(
  'python-nautilus: enable Nautilus right-click extension'
)
checkdepends=(
  'python-pytest'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/onionshare/onionshare/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('544b288fbab26ea74fb4a23fb9e390ebf4b0a8854677f7dccfa1d2bf5119cc6fe539e7737cb926beb7ce31d08b45077011d9155926d7b52b5672c5c564684692')
b2sums=('e9a85206a69c2c97b55d3f27afd231610b7272973868c0b359ea88f6f623fd1e68b9997f58b256f96c3e977aec6ce1eb1b54a687c79b939f5c3938c5a841f760')

prepare() {
  sed -i '/^onionshare-cli = /d' ${pkgname}-${pkgver}/desktop/pyproject.toml
}

build() {
  cd ${pkgname}-${pkgver}/cli
  python -m build --wheel --no-isolation
  cd ../desktop
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  pushd cli
  PYTHONPATH=".:${PYTHONPATH}" pytest tests/
  popd
  pushd desktop
  #PYTHONPATH="src:../cli:${PYTHONPATH}" pytest tests/
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" cli/dist/*.whl
  python -m installer --destdir="${pkgdir}" desktop/dist/*.whl

  install -Dm 644 desktop/org.onionshare.OnionShare.desktop -t "${pkgdir}/usr/share/applications/"
  install -Dm 644 desktop/org.onionshare.OnionShare.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
  install -Dm 644 desktop/org.onionshare.OnionShare.appdata.xml -t "${pkgdir}/usr/share/metainfo/"
}

# vim: ts=2 sw=2 et:
