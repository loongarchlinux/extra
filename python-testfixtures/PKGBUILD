# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testfixtures
pkgver=8.3.0
pkgrel=1
pkgdesc="A collection of helpers and mock objects that are useful when writing unit tests or doc tests"
arch=('any')
license=('MIT')
url="https://github.com/Simplistix/testfixtures"
depends=('python')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-zope-component' 'python-sybil'
              'python-pytest-django' 'python-django' 'python-twisted')
source=("git+https://github.com/Simplistix/testfixtures.git#tag=$pkgver")
sha512sums=('d1cdede31a90df35cecbb33e15462d9379a2f70152cc3006378f07860c6d2e5fde7171e8c08f7a6c359f0d443a142dee227345b052b09cf3a30a627351ffb696')

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
