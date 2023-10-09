# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-semver
pkgver=3.0.1
_commit=c2680608bc9b080a1f34161a36971e8331a19056
pkgrel=1
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
