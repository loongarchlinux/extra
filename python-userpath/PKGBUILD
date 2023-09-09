# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

_pkgname=userpath
pkgname=python-$_pkgname
pkgver=1.9.1
pkgrel=1
pkgdesc='Cross-platform tool for adding locations to the user PATH, no elevated privileges required!'
arch=('any')
url='https://github.com/ofek/userpath'
license=('MIT')
depends=('python' 'python-click' 'python-distro')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a98b000a0968f81131eb5a91822fda72bc38e6aa2b2a85be43974c37155cbf23aa2698dac1969f078bcca1ebcbc9bd5ef71e4437eae691b7358610bcc74859d5')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  pytest
}

package() {
  cd $_pkgname-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
