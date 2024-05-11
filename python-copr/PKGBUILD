# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-copr
pkgver=1.127
pkgrel=3
pkgdesc="Python interface for Copr"
url="https://github.com/fedora-copr/copr"
license=('GPL-2.0-or-later')
arch=('any')
depends=('python-filelock' 'python-requests' 'python-requests-toolbelt' 'python-setuptools'
         'python-six' 'python-munch' 'python-future')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-requests-gssapi')
source=("https://github.com/fedora-copr/copr/archive/python-copr-$pkgver-1.tar.gz")
sha512sums=('96ce147a90f0ead84d251b22636b82029c617800481ad8a52e7048e375600cd35f03261e52a2f5aad384e125749846674eb08b04dbe40e8556b595a67f35cc12')

build() {
  cd copr-python-copr-$pkgver-1/python
  python -m build --wheel --no-isolation
}

check() {
  cd copr-python-copr-$pkgver-1/python
  python -m pytest
}

package() {
  cd copr-python-copr-$pkgver-1/python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
