# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

pkgname=python-pytools
pkgver=2024.1.5
pkgrel=1
pkgdesc="A collection of tools for Python"
arch=('any')
url="https://github.com/inducer/pytools"
license=('MIT')
depends=('python-numpy' 'python-platformdirs' 'python-typing_extensions')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
source=("git+https://github.com/inducer/pytools.git#tag=v$pkgver")
sha512sums=('cb00e508c9c64545fd3d0395721e3bd1794b8c547490316c1b11e4df338ef37714e723f59519b026193d92514fc41e5af6f6fc405c6227803635527a485cf54f')

build() {
  cd pytools
  python setup.py build
}

check() {
  cd pytools
  python -m pytest
}

package(){
  cd pytools
  python setup.py install --prefix=/usr --root="$pkgdir" --skip-build --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
