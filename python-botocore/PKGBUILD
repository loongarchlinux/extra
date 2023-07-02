# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Ainola
# Contributor: Chris Fordham

pkgname=python-botocore
# UPDATE_BLOCKED: newer python-botocore will likely break python-aiobotocore
pkgver=1.29.162
pkgrel=1
pkgdesc='A low-level interface to a growing number of Amazon Web Services'
arch=('any')
url="https://github.com/boto/botocore"
license=('Apache')
depends=('python' 'python-certifi' 'python-dateutil' 'python-jmespath' 'python-urllib3')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-awscrt')
# Tests need the 'ps' binary
checkdepends=('python-pytest' 'python-pytest-xdist' 'python-jsonschema' 'procps-ng')
optdepends=(
  'python-awscrt'
)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz
        tests-keep-env.diff)
sha256sums=('7fa0a0f16b4498b81d220afee2e02a3f99b8fdb82d86eb85d134e48d2609f49b'
            '15c588d3f4cfcc0ef26fc4ff367eb6dc12dc2f303e299cbe397288089ee52a11')

prepare() {
  cd botocore-$pkgver
  # https://github.com/boto/botocore/pull/2791
  patch -Np1 -i ../tests-keep-env.diff
}

build() {
  cd botocore-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd botocore-$pkgver

  export AWS_SECRET_ACCESS_KEY=fake_key
  export AWS_ACCESS_KEY_ID=fake_id

  export PYTHONPATH="$PWD"

  # Many integration tests need real credentials
  PYTHONDONTWRITEBYTECODE=1 pytest tests -n auto --ignore=tests/integration
}

package() {
  cd botocore-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
