# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archliunx.org>

_pkgname=precis_i18n
pkgname=python-precis_i18n
pkgver=1.1.0
pkgrel=2
pkgdesc='PRECIS framework (RFC 8264, RFC 8265, RFC 8266)'
url='https://github.com/byllyfish/precis_i18n'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('b208f09ff13de45df1796dc3aea87d432e9e1fc1702ba9be65375c5bf410f0548947568abdfc9ddbbfa67fea27b5452e7bc53a8f054696808dc3fc680473ff1a')
b2sums=('0da630b1790f5aeb3a81467b29522745e77e6aed349b077b49f9bc9046b92e2bbc43b5e059a2b52a5a602c21a374dcb4af91f0c57357a3984fa92dcfafee36bb')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pkgname}-${pkgver}
  pytest
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
