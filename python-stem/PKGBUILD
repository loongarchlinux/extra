# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Spider.007 <archlinux AT spider007 DOT net>

pkgname=python-stem
_pypiname=${pkgname#*-}
pkgver=1.8.3
pkgrel=2
pkgdesc='Python controller library for Tor'
url='https://stem.torproject.org/'
arch=('any')
license=('LGPL-3.0-only')
depends=(
  'procps-ng'
  'python'
  'python-cryptography'
  'python-pynacl'
)
checkdepends=('tor')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel' git
)
optdepends=('tor: tor-server to talk to')
replaces=('stem')
provides=('stem')
source=(https://github.com/torproject/stem/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz
        fix-build-cryptography.patch
        9f1fa4ac.patch)
sha256sums=('789e591d30b5682ef65dd463ca80bfeb4a8bf69348b77c4733a701449bc837f4'
            '453877455a4368d445ad2a0011f31500ed553d69a785d7795be33437d004af6e'
            'da98f979ebab18df470b4d94da06626edf203561d853ddad9444d995b693df90')

prepare() {
  cd ${_pypiname}-${pkgver}
  # remove flaky integration tests
  sed -i test/settings.cfg \
    -e '/|test.integ.client.connection.TestConnection/d' \
    -e '/|test.integ.process.TestProcess/d' \
    -e '/|test.integ.installation.TestInstallation/d' \
    -e '/|test.integ.control.controller.TestController/d'
  rm test/integ/{client/connection,{installation,process},control/controller}.py
  # fix tests with python 3.12
  find -type f -exec sed -e 's|assertRaisesRegexp|assertRaisesRegex|' -i {} \;
  # fix tests with cryptography>=42
  patch -p1 -i ../fix-build-cryptography.patch
  patch -p1 -i ../9f1fa4ac.patch
}

build() {
  cd ${_pypiname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pypiname}-${pkgver}
  ./run_tests.py --all
}

package() {
  cd ${_pypiname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim: ts=2 sw=2 et:
