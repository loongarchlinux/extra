# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=python-cachelib
_pkgname=${pkgname#python-}
pkgver=0.13.0
pkgrel=1
pkgdesc="A collection of cache libraries in the same API interface. Extracted from werkzeug"
arch=(any)
url="https://github.com/pallets/cachelib"
license=(BSD-3-Clause)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  memcached
  python-boto3
  python-pylibmc
  python-pytest-xprocess
  python-redis
  redis
)
optdepends=(
  'python-boto3: for S3 backend'
  'python-pylibmc: for memcached backend'
  'python-pymongo: for MongoDB backend'
  'python-redis: for Redis backend'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b981bdb6ed477ae037f88a9fea90bf14e6137c9b2c54a5d56b9783404a9f9b4c')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  pytest \
    --deselect tests/test_dynamodb_cache.py \
    --deselect tests/test_mongodb_cache.py
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.rst
}
