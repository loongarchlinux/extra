# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-boto3
pkgver=1.34.22
pkgrel=1
pkgdesc='The AWS SDK for Python'
arch=('any')
license=('Apache')
url='https://github.com/boto/boto3'
depends=('python' 'python-botocore' 'python-jmespath' 'python-s3transfer')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-xdist' 'python-awscrt')
optdepends=(
  'python-awscrt: AWS CRT S3 transfers'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/boto/boto3/archive/$pkgver.tar.gz")
sha512sums=('7a7a5431b2410303688e76c8e48561606d173757ed0fc98d1b0ef7511927f45b8fa9eab9d9baaad04c1c705deddc330d422cbc83bde03b82b194ee55fe3be300')

build() {
  cd boto3-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd boto3-$pkgver

  export AWS_SECRET_ACCESS_KEY=fake_key
  export AWS_ACCESS_KEY_ID=fake_id

  export PYTEST_XDIST_AUTO_NUM_WORKERS=$(echo "$MAKEFLAGS" | grep -oP '\-j\s*\K[0-9]+')
  pytest_args=()
  if [ -n "$PYTEST_XDIST_AUTO_NUM_WORKERS" ]; then
    pytest_args+=(-n auto)
  fi

  # Many integration tests need real credentials
  pytest tests "${pytest_args[@]}" --ignore=tests/integration
}

package() {
  cd boto3-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
