# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=sphinx-pytest
pkgname=python-$_pkgname
pkgver=0.1.1
pkgrel=1
pkgdesc='Helpful pytest fixtures for sphinx extensions'
arch=('any')
url='https://github.com/chrisjsewell/sphinx-pytest'
license=('MIT')
depends=('python-sphinx' 'python-pytest')
makedepends=('python-build' 'python-installer' 'python-flit-core' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('f3210f8b2413171cc37a38fc66b8be0cd32db1a0aebb979dc9057a861711481fde6b86b7c9548166f906d9483762b864759fb4f7ba5069cda4d9fc12c1e2975c')

build() {
  cd $_pkgname-$pkgver

  python -m build -nw
}

#check() {
#  cd $_pkgname-$pkgver
#
#  PYTHONPATH=src python -m pytest
#}

package() {
  cd $_pkgname-$pkgver

  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
