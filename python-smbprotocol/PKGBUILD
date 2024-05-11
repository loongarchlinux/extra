# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkg=smbprotocol
pkgname=python-${_pkg}
pkgver=1.12.0
pkgrel=3
pkgdesc="SMBv2 and v3 client"
arch=(any)
url="https://github.com/jborean93/smbprotocol"
license=(MIT)
depends=(python-cryptography python-pyspnego)
makedepends=(git python-setuptools)
checkdepends=(python-pytest python-pytest-mock python-gssapi)
optdepends=('python-gssapi: Kerberos support')
# tags are not signed, commits only
_commit=190667f41c5c8856db741efc133c27a624a7a2bf # git rev-parse v${pkgver}
#source=(git+${url}.git#commit=${_commit}?signed)
# 1.9.0 was signed using GitHub key
source=(git+${url}.git#commit=${_commit})
sha256sums=('SKIP')
validpgpkeys=(A03A0E13C2EFFD384B1EC39A2AAC89085FBBDAB5) # Jordan Borean <jborean93@gmail.com>

build() {
  cd ${_pkg}
  python setup.py build
}

check() {
  cd ${_pkg}
  PYTHONPATH="${PWD}"/src pytest -vv --color=yes
}

package() {
  cd ${_pkg}
  python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
