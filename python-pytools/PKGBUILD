# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

pkgname=python-pytools
pkgver=2023.1
pkgrel=1
pkgdesc="A collection of tools for Python"
arch=('any')
url="https://mathema.tician.de/software/pytools"
license=('MIT')
depends=('python-numpy' 'python-platformdirs' 'python-typing_extensions')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/p/pytools/pytools-$pkgver.tar.gz")
sha512sums=('1d035f8b5e155def84d084926ab43b7e4c634cf7b2cd3e3914513360570bf87da059c8109e0257797dbe84c4bc36af559c805b252c863f2145113ff681eb5974')

build() {
  cd pytools-$pkgver
  python setup.py build
}

check() {
  cd pytools-$pkgver
  python -m pytest
}

package(){
  cd pytools-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --skip-build --optimize=1
}
