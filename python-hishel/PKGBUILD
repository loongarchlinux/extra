# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-hishel
_name="${pkgname#python-}"
pkgver=0.0.26
pkgrel=2
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
  python-moto
  python-pytest
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
sha512sums=('1d5d55e2ad2743ac15b258c1246a21975c4e8bf5786e331d55acc6e5cb82c0393b23b7c00a5ea9f6f8070e5e3cf6d5f6d9755315403748259d99e6ce20ccd27f')
b2sums=('e8273020c3b69edc0a080940d8462d33c4eb6b6bbb6f0325975ef29e15d0f16c57a31406f24ae56ad651722ccf6ff704afcedb917417355f67b7536d80dc0c3f')

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
