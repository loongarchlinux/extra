# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pipx
pkgname=python-$_pkgname
pkgver=1.6.0
pkgrel=1
pkgdesc='Install and Run Python Applications in Isolated Environments'
arch=('any')
url='https://github.com/pipxproject/pipx'
license=('MIT' 'BSD')
depends=('python' 'python-userpath' 'python-argcomplete' 'python-packaging' 'python-platformdirs')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel' 'python-hatch-vcs')
#checkdepends=('python-tox' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('ae241bb518b240348b5811ee9d278c927cc0e703e6cd0da6225b2e47d727ac1ab54b5ac8fc207da849afc383cfe77ca6a95a62efcb33edc238bb607eada8b00b')

build() {
  cd $_pkgname-$pkgver

  SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver} \
  python -m build -nw
}

#check() {
#  cd $_pkgname-$pkgver
#
#  nox
#}

package() {
  cd $_pkgname-$pkgver

  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
