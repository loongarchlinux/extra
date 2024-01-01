# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pyname=archinfo
pkgname=python-${_pyname}
pkgver=9.2.81
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
sha512sums=('bae6bfa6cc13d0c536a8a3b6d8dc66dff97932aebd4155e940ee0009d629fae771e2755b4323805ea7fdbc200b4177d25d7ac01ffbb4dbe49f37615215f730e2')
b2sums=('c60e6dcd7f1d30606c0e9b55c5f56c8e06e8cf391389d46c828f8a4252654834b7592c4e4fbda68795a84f9ad8a51e0a5ad36fd71c7d1d7266d045583fba542e')

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
