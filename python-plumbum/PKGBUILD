# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-plumbum
_name=plumbum
pkgver=1.8.3
pkgrel=1
pkgdesc='A small yet feature-rich Python library for shell script-like programs, and more'
url='https://github.com/tomerfiliba/plumbum'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-hatch-vcs' 'python-hatchling' 'python-installer')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('e59dd98939739636c3f1541e24f3c5a4b0c9bbe54b77d378875a57f167ca1916adbca6b33c7779d37e5daebd949c9a9d77bfffc404e55d319027658b5a504088')
b2sums=('7c3df70e5bcaf5dfd9c6898f0d2044c647f08a4eaa0eb6bcb616c9971edfc20aa7651dc70a193e06c1d1f97b155a86a6d93d14622ff40da1328b1aa0e6534e6b')

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
