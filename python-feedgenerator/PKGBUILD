# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# AUR Maintainer: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: Chaoswizard <chaoswizard@gmail.com>
_name=feedgenerator
pkgname="python-${_name}"
pkgver=2.1.0
pkgrel=4
pkgdesc="Standalone version of django.utils.feedgenerator (python3)."
url="https://pypi.org/project/feedgenerator/"
arch=('any')
license=('GPL')
depends=('python' 'python-pytz' 'python-six')
makedepends=('python-distribute' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov')
source=("https://pypi.python.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('b8b41f5b256130166c8dba34dd950782f9acb506e3e37a2fe13b5e1f9d33f7d39b7f862e446f4f6f2f480973617feb70303f78a4fb6741f110166e61b92f0075')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}


check() {
  cd "${_name}-${pkgver}"
  pytest -v
}
