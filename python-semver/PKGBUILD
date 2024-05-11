# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-semver
pkgver=3.0.2
_commit=ec9348aefd8e9f287f451fcf2e837621a40e3ca4
pkgrel=2
pkgdesc="Python helper for Semantic Versioning"
url="https://github.com/python-semver/python-semver"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm'
             'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov')
source=("git+https://github.com/python-semver/python-semver.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd python-semver
  python -m build -nw
}

check() {
  cd python-semver
  pytest
}

package() {
  cd python-semver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
