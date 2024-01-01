# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pyname=pyaxmlparser
pkgname=python-${_pyname}
pkgver=0.3.30
pkgrel=1
pkgdesc='Parser for Android XML file and get Application Name without using Androguard'
url='https://github.com/appknox/pyaxmlparser'
arch=('any')
license=('Apache')
depends=('python' 'python-lxml' 'python-click' 'python-asn1crypto' 'python-magic')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('75f2365205d20cb5ac1c432ed399dfccf66ffb108dce97a3176f042f9691b2dfa2683f4428d2a0a4d7824e68a52ac890bb55a7722e86e713a8be9369e17ba9aa')
b2sums=('3c2e9b3ae50df0231557974486eb27c875abfce5b337aa9cbdb09e76a15384c6be2fe0e80f67fb93f193e23bb019dbd02aabe18d23147ae6f867926b17d086a5')

build() {
  cd ${_pyname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pyname}-${pkgver}
  PYTHONPATH=build/lib pytest
}

package() {
  cd ${_pyname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
