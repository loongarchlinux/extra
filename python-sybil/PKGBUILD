# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-sybil
pkgver=5.0.2
_commit=49bf17b4ef4039cfd0e7d43055fb5620ff72b878
pkgrel=1
pkgdesc='Automated testing for the examples in your documentation.'
arch=('any')
license=('MIT')
url='https://github.com/cjw296/sybil'
depends=('python')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-seedir' 'python-testfixtures')
source=("git+https://github.com/cjw296/sybil.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd sybil
  python setup.py build
}

check() {
  cd sybil
  python -m pytest
}

package() {
  cd sybil
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
