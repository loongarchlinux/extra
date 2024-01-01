# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: crab2313 <crab2313@gmail.com>

pkgname=python-gitlab
pkgver=4.3.0
pkgrel=1
pkgdesc="Python wrapper for the GitLab API"
arch=('any')
url="https://github.com/python-gitlab/python-gitlab"
license=('LGPL3')
depends=('python' 'python-requests' 'python-requests-toolbelt')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pyyaml' 'python-responses')
optdepends=(
  'python-argcomplete: for autocompletion'
  'python-pyyaml: for YAML support'
)
source=($pkgname-$pkgver.tar.gz::https://github.com/python-gitlab/python-gitlab/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('98be5ef934461637565f41286753399bb4bb0b0d3ca5b49f352a55c26951e3014c1b3f44a6eb40fd58de8cc8ffc4f97ea8d77335fd60e0c039b11041c9425083')
b2sums=('5a2dc923156b98c6f5598a5d1f4a527a82a294295f0d1e660bd834ca2e58d480909b8a9b481cc15e25e2822d25230e2516c71a3f45a0f7864adb12c38e3e17ae')

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
