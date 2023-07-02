# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Spider.007 <archlinux AT spider007 DOT net>

pkgname=python-stem
_pypiname=${pkgname#*-}
pkgver=1.8.2
pkgrel=1
pkgdesc='Python controller library for Tor'
url='https://stem.torproject.org/'
arch=('any')
license=('LGPL3')
depends=('python' 'python-cryptography' 'python-pynacl' 'procps-ng')
checkdepends=('tor')
optdepends=('tor: tor-server to talk to')
replaces=('stem')
provides=('stem')
source=(https://github.com/torproject/stem/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz
        ${pkgname}-${pkgver}.tar.gz.asc::https://github.com/torproject/stem/releases/download/${pkgver}/${pkgver}.tar.gz.asc)
sha256sums=('46e1f2ac564b0dd8f0d88c108d7f45e5c16a436bd8b86d16fed95c327b247759'
            'SKIP')
validpgpkeys=('2DA81D01455C3A0032198850F305447AF806D46B') # <juga@riseup.net>

prepare() {
  cd ${_pypiname}-${pkgver}
  # https://github.com/torproject/stem/issues/56
  sed -i '/MOCK_VERSION/d' run_tests.py
  # remove flaky integration tests
  sed -i test/settings.cfg \
    -e '/|test.integ.client.connection.TestConnection/d' \
    -e '/|test.integ.process.TestProcess/d' \
    -e '/|test.integ.installation.TestInstallation/d' \
    -e '/|test.integ.control.controller.TestController/d'
  rm test/integ/{client/connection,{installation,process},control/controller}.py
}

build() {
  cd ${_pypiname}-${pkgver}
  python setup.py build
}

check() {
  cd ${_pypiname}-${pkgver}
  ./run_tests.py --all
}

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install --optimize=1 --root="${pkgdir}" --skip-build
}

# vim: ts=2 sw=2 et:
