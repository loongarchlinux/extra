# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=python-aiopg
_pkgname=${pkgname#python-}
pkgver=1.4.0
pkgrel=4
pkgdesc="Library for accessing a PostgreSQL database from the asyncio"
arch=(any)
url="https://github.com/aio-libs/aiopg"
license=(BSD-2-Clause)
depends=(
  python
  python-async-timeout
  python-psycopg2
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
# checkdepends=(
#   python-docker
#   python-pytest
#   python-sqlalchemy
# )
optdepends=('python-sqlalchemy: SQLAlchemy support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1b1c2ae3449640fa8fbaa95fe893c83df6ee5195b7018ce5c1b4427f95979509')

_archive=$_pkgname-$pkgver

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

# All tests require a running PostgreSQL Docker container
# check() {
#   cd "$_archive"
#
#   python -m installer -d tmp_install dist/*.whl
#   local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
#   PYTHONPATH="$PWD/tmp_install/$site_packages" pytest
# }

package() {
  cd "$_archive"

  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
