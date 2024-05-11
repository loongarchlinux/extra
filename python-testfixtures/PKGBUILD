# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testfixtures
pkgver=8.1.0
_commit=e1b719f6c79156effd5935f90bcf06e2fbf5382a
pkgrel=3
pkgdesc="A collection of helpers and mock objects that are useful when writing unit tests or doc tests"
arch=('any')
license=('MIT')
url="https://github.com/Simplistix/testfixtures"
depends=('python')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-zope-component' 'python-sybil'
              'python-pytest-django' 'python-django' 'python-twisted')
source=("git+https://github.com/Simplistix/testfixtures.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd testfixtures
  python setup.py build
}

check() {
  cd testfixtures
  PYTHONPATH="$PWD" pytest --ignore=build
}

package() {
  cd testfixtures
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 docs/license.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
