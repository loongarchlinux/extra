# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python-ptrace
pkgver=0.9.9
pkgrel=3
pkgdesc='Python binding of ptrace library to trace processes and syscalls'
url='https://github.com/vstinner/python-ptrace'
arch=('any')
license=('GPL-2.0-only')
depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-sphinx'
  'python-wheel'
)
source=(
  $url/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz
)
sha512sums=('5f2291a4ca642ab99c49e853f12a3cd4ee911df45326fe077ef5df82b813b54a4351c3c23a195b65342af37aed8ecbc26968f65ce9b6a974863bee0ffd556039')
b2sums=('ff9b85e17fd8d767c3fd1db13f1c69ad0b4e7d47379d6ee9468d9424702d34d7a7a7489590987213707829ab62e5eb83df277d3b60de6d2ad05ac99b93586ca3')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
  make -j1 -C doc man text SPHINXBUILD=sphinx-build
}

check() {
  cd ${pkgname}-${pkgver}
  python runtests.py || echo "Warning: tests only run in an env with ptrace allowed"
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 doc/build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a examples "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 doc/build/man/${pkgname}.1 -t "${pkgdir}/usr/share/man/man1"
}

# vim: ts=2 sw=2 et:
