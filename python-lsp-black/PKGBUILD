# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=python-lsp-black
pkgver=1.3.0
pkgrel=1
pkgdesc="python-lsp-server plugin that adds support to black autoformatter, forked from pyls-black"
arch=(any)
url="https://github.com/python-lsp/python-lsp-black"
license=(MIT)
depends=(python-black python-lsp-server python-toml)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('e17cc0fb7327b1b2377f197480690e0b9f908c688058f07262647c69a00c0d95')

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

check() {
  cd ${pkgname}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python setup.py install --skip-build
  test-env/bin/python -m pytest -vv --color=yes tests
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
