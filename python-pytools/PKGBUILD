# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

pkgname=python-pytools
pkgver=2023.1.1
pkgrel=1
pkgdesc="A collection of tools for Python"
arch=('any')
url="https://mathema.tician.de/software/pytools"
license=('MIT')
depends=('python-numpy' 'python-platformdirs' 'python-typing_extensions')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/p/pytools/pytools-$pkgver.tar.gz")
sha512sums=('0b8d4ec7145a42d9a679b7e08a05aa126c7d4514faa77e207fb154c84e56233b80dd49f388f261ba29e70e2cff836f6c850ea05af81360da8120756a0db35e6a')

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
