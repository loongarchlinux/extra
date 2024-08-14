# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=python-multipart
pkgname=python-$_pkgname
pkgver=0.0.9
pkgrel=1
pkgdesc='streaming multipart parser for Python'
arch=('any')
url='https://github.com/andrew-d/python-multipart'
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-yaml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('6e41be080e079b1e9730e61d72b5b339fbb447bfb2b171a617c17025c5ad69924ca3c24f39e160f7b1cc495cea0999e72e6674e5631ce88a48240ecc229d0343')

build() {
  cd $_pkgname-$pkgver

  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver

  pytest -v
}

package() {
  cd $_pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
