# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-hishel
_name="${pkgname#python-}"
pkgver=0.0.30
pkgrel=1
pkgdesc="An elegant HTTP Cache implementation for HTTPX and HTTP Core"
arch=(any)
url="https://github.com/karpetrosyan/hishel"
license=(BSD-3-Clause)
depends=(
  python
  python-anyio  # pulled in by python-httpx
  python-httpcore  # pulled in by python-httpx
  python-httpx
  python-typing_extensions
)
makedepends=(
  python-build
  python-hatchling
  python-hatch-fancy-pypi-readme
  python-installer
)
checkdepends=(
  python-anyio
  python-anysqlite
  python-pytest
  python-pyyaml
  python-redis
  python-trio
)
optdepends=(
  'python-boto3: for S3 support'
  'python-pyyaml: for YAML support'
  'python-redis: for Redis support'
  'python-anysqlite: for SQLite support'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('f55f04badfe9ea161e20d8eca631cc02f9b1195ddaf3ba75b5e1a0ef143337a13438181ede9c853f30f7a24d3b6e59cffdc044860fc564d18392a59bd603c5c9')
b2sums=('932150b3464dcbc4fc2ff1361bafa6b2ea3fef496b0c89117c18b62122d07b0d71db66762e3eb87edb03f84eb4af0273f1792131e110291924bb29299051741a')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vvv
    # we don't care about testing redis
    --deselect 'tests/_async/test_storages.py::test_redisstorage'
    --deselect 'tests/_async/test_storages.py::test_redisstorage_expired'
    --deselect 'tests/_async/test_storages.py::test_redis_ttl_after_hits'
    --deselect 'tests/_sync/test_storages.py::test_redisstorage'
    --deselect 'tests/_sync/test_storages.py::test_redisstorage_expired'
    --deselect 'tests/_sync/test_storages.py::test_redis_ttl_after_hits'
  )

  cd $_name-$pkgver
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
