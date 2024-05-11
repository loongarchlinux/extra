# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-rpyc
_name=rpyc
pkgver=6.0.0
pkgrel=2
pkgdesc='Remote Python Call - A transparent and symmetric RPC library for python'
url='https://github.com/tomerfiliba-org/rpyc'
arch=('any')
license=('MIT')
depends=(
  'python'
  'python-plumbum'
)
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
source=(https://github.com/tomerfiliba-org/${_name}/archive/${pkgver}/${_name}-${pkgver}.tar.gz)
sha256sums=('3492e83d7dd67011a9215612c13d92f52e96a0690fc7bbaea4b3ead1e9de5517')
b2sums=('e55d008dc772be7fd4bae9065a5eabcf5612faf8131e8161e7921eeb84475183c677687ef8606c664003089ae714d4cb403ff6afa26d2695a8fe763d549aab0d')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
