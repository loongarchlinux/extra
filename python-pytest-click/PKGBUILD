# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname=python-pytest-click
pkgver=1.1.0
pkgrel=4
pkgdesc='pytest plugin for Click'
arch=('any')
url='https://github.com/Stranger6667/pytest-click'
license=('MIT')
depends=('python' 'python-click' 'python-pytest')
makedepends=('python-setuptools' 'python-build' 'python-wheel' 'python-installer')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('aed7a67477cc523789063c72b8da67ae09cfbade6d66d77a2dc098821648324b2d3caf8d187b5dcca2dbd013c2eaac173cb0a7ed8f4db0f69279cdaee4978ed6')

build() {
  cd "pytest-click-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "pytest-click-${pkgver}"
  PYTHONPATH="$PWD/src" pytest -vv
}

package() {
  cd "pytest-click-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
