# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pipx
pkgname=python-$_pkgname
pkgver=1.4.1
pkgrel=1
pkgdesc='Install and Run Python Applications in Isolated Environments'
arch=('any')
url='https://github.com/pipxproject/pipx'
license=('MIT' 'BSD')
depends=('python' 'python-userpath' 'python-argcomplete' 'python-packaging' 'python-platformdirs')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel' 'python-hatch-vcs')
#checkdepends=('python-tox' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('04fa29b02a25f21544ae2bbc86fa927fd3c03f98b3f1bd6beee318cbb34849edfbd553fb3b9f94015aab16039aa49f706092a75bd2f865f04dec56a34da43f1f')

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
