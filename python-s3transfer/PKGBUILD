# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com

pkgname=python-s3transfer
# https://github.com/boto/s3transfer/blob/develop/CHANGELOG.rst
pkgver=0.8.2
pkgrel=1
pkgdesc='Amazon S3 Transfer Manager for Python'
arch=('any')
url="https://github.com/boto/s3transfer"
license=('Apache')
depends=('python' 'python-botocore')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel'
             'python-awscrt')
checkdepends=('python-pytest')
optdepends=(
  'python-awscrt'
)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('90b336fde3c5962ca6fd18539ccfb84a2d749f4cb80869916aac38d96b41272e')

build() {
  cd s3transfer-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd s3transfer-$pkgver
  # Many integration tests need real credentials
  pytest tests --ignore=tests/integration
}

package() {
  cd s3transfer-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
