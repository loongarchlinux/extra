# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname=python-pytest-click
pkgver=1.1.0
pkgrel=1
pkgdesc='pytest plugin for Click'
arch=('any')
url='https://github.com/Stranger6667/pytest-click'
license=('BSD')
makedepends=('python-setuptools')
checkdepends=('python-tox')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('aed7a67477cc523789063c72b8da67ae09cfbade6d66d77a2dc098821648324b2d3caf8d187b5dcca2dbd013c2eaac173cb0a7ed8f4db0f69279cdaee4978ed6')

build() {
  cd "pytest-click-${pkgver}"
  python setup.py build
}

check() {
  cd "pytest-click-${pkgver}"
  tox -e py
}

package() {
  cd "pytest-click-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
