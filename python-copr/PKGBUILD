# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-copr
pkgver=1.126
pkgrel=1
pkgdesc="Python interface for Copr"
url="https://github.com/fedora-copr/copr"
license=('GPL')
arch=('any')
depends=('python-filelock' 'python-requests' 'python-requests-toolbelt' 'python-setuptools'
         'python-six' 'python-munch' 'python-future')
checkdepends=('python-pytest' 'python-requests-gssapi')
source=("https://github.com/fedora-copr/copr/archive/python-copr-$pkgver-1.tar.gz")
sha512sums=('77ac66f583ca3e58f2af8eef4c11f24290287023a99336ec71d9bc8f7d57916f40ef50bda548ec4a724f676f45f15e4d92bcd4ec22709e0e8f0a1f5765c03f8a')

build() {
  cd copr-python-copr-$pkgver-1/python
  python setup.py build
}

check() {
  cd copr-python-copr-$pkgver-1/python
  python -m pytest
}

package() {
  cd copr-python-copr-$pkgver-1/python
  python setup.py install --root="$pkgdir" --optimize=1
}
