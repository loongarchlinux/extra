# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pyname=archinfo
pkgname=python-${_pyname}
pkgver=9.2.101
pkgrel=1
pkgdesc='Classes with architecture-specific information useful to other projects'
url='https://github.com/angr/archinfo'
arch=('any')
license=('custom:BSD2')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=(
  'python-capstone'
  'python-unicorn'
  'python-keystone'
  'python-pyvex'
)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a4eb89bfc305f166ce26887a38b20a98b59cf68a2560c521cf3ab7a36f88259ce4c24bc7f4a1ffbf7821c0284b6bc641fb1d6d37d3654fde83025740ca2b3514')
b2sums=('5d92dd1bbec9a445ef545505c5d4d9de59c0dee4903137eda088052c75c26643fa7f9f88688d2c239d9d2ba9052173cac1133884f035792683ba661a4ea90a92')

build() {
  cd "${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
