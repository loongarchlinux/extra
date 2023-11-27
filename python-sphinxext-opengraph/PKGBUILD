# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

_name=sphinxext-opengraph
pkgname=python-$_name
pkgver=0.9.0
pkgrel=1
pkgdesc="Sphinx extension to generate unique OpenGraph metadata"
arch=('any')
url="https://sphinxext-opengraph.readthedocs.io/"
license=('BSD')
depends=('python-sphinx' 'python-matplotlib')
makedepends=('python-setuptools' 'python-setuptools-scm')
source=(https://files.pythonhosted.org/packages/source/s/$_name/$_name-$pkgver.tar.gz)
sha256sums=('4e57e25b6d56f47b9c06a5a5d68a2a00ed3577c8a39e459b52118c6bfe5e8c8b')

prepare() {
  cd $_name-$pkgver
}

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}

# vim:set ts=2 sw=2 et:
