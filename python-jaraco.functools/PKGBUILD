# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-jaraco.functools
# https://github.com/jaraco/jaraco.functools/blob/main/CHANGES.rst
pkgver=3.7.0
pkgrel=1
pkgdesc='Functools like those found in stdlib'
arch=('any')
url='https://github.com/jaraco/jaraco.functools'
license=('MIT')
depends=('python' 'python-more-itertools')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest' 'python-jaraco.classes')
conflicts=('python-jaraco')
replaces=('python-jaraco')
source=("https://files.pythonhosted.org/packages/source/j/jaraco.functools/jaraco.functools-$pkgver.tar.gz")
sha512sums=('37b33b526a3f3cff259c93c764bdde06015440bef025d9f5a177125a654abb23f96d71f0b4f4e73cdfe7274af1575a01d8e112f9d333cbe12f53b1583bae1d5a')

build() {
  cd jaraco.functools-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd jaraco.functools-$pkgver
  pytest
}

package() {
  cd jaraco.functools-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
