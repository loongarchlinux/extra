# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=python-colorlog
pkgver=6.8.2
pkgrel=2
pkgdesc='A colored formatter for the python logging module'
arch=('any')
url='https://github.com/borntyping/python-colorlog'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ae63ec6a78ad27d3022bc39cb5d674c40afc6ae5bee225b5133c2488ec7f7fcb871bc752c8f2d3f7da261313e8b65895ff0ca55ce7495d71d9caca53562feb66')

build() {
  cd $pkgname-$pkgver

  python -m build -nw
}

package() {
  cd $pkgname-$pkgver

  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
