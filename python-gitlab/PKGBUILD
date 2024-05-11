# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: crab2313 <crab2313@gmail.com>

pkgname=python-gitlab
pkgver=4.4.0
pkgrel=2
pkgdesc="Python wrapper for the GitLab API"
arch=('any')
url="https://github.com/python-gitlab/python-gitlab"
license=('LGPL-3.0-or-later')
depends=('python' 'python-requests' 'python-requests-toolbelt')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pyyaml' 'python-responses')
optdepends=(
  'python-argcomplete: for autocompletion'
  'python-pyyaml: for YAML support'
)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('cb572d169d948dcd74b1d85fb4e8fc2b2593ad167dd708f38bcaf5cccacc8a8b32231b2231d9cb69909e63ba0ce2c6f1cf522f21df56659343314ea2c0d39645')
b2sums=('fc75fcbaedc131c432cee980c64936bf6e40ae3b5605f1a82c48d2a983ad5ab856a15086bf169334830e3a43f0eefb978c27db480cd5a2c0802c8fadd85df917')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  pytest -v --ignore tests/functional/
}

package() {
  python -m installer --destdir="$pkgdir" $pkgname-$pkgver/dist/*.whl
}
