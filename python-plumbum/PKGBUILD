# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-plumbum
_name=plumbum
pkgver=1.8.2
pkgrel=1
pkgdesc='A small yet feature-rich Python library for shell script-like programs, and more'
url='https://github.com/tomerfiliba/plumbum'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-hatch-vcs' 'python-hatchling' 'python-installer')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('636d10ea1c727cb24d4692537f3c0005077f86c3d9d2ae244f86ef5dd9621f8b51e0b5efffaa7acf66d6ba5552fddd641d4a1796c7fd760ac0a27d029f685c20')
b2sums=('d21a105d9919f70ad480d5de7ce157f2ae6c56cd248a2b70ad037c83a5e4b56bd8bdb3d9587860db383b04dd6528828426b47895c345f8bf7dc4931310be343d')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-${pkgver}"
  PYTHONPATH=. python -c 'import plumbum'
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
