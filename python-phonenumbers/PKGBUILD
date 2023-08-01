# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-phonenumbers
pkgver=8.13.16
_commit=6a69bbd0e2d2986b3a0f90ceb521c4ed8663ed9f
pkgrel=1
pkgdesc="Python version of Google's common library for parsing, formatting, storing and validating international phone numbers"
arch=('any')
url="https://github.com/daviddrysdale/python-phonenumbers"
license=('Apache')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/daviddrysdale/python-phonenumbers.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd python-phonenumbers/python
  python setup.py build
}

check() {
  cd python-phonenumbers/python
  python setup.py test
}

package() {
  cd python-phonenumbers/python
  python setup.py install -O1 --root "$pkgdir"
}
