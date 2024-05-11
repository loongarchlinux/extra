# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=databases
pkgname=python-$_pkgname
pkgver=0.8.0
pkgrel=2
pkgdesc='Async database support for Python'
arch=('any')
url='https://github.com/encode/databases'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-asyncpg: postgresql support'
            'python-aiopg: postgresql + aiopg support'
            'python-aiomysql: mysql support'
            'python-aiosqlite: sqlite support')
#checkdepends=('python-pytest-runner' 'python-asyncpg' 'python-psycopg2' 'python-aiopg'
#              'python-aiomysql' 'python-pymysql' 'python-aiosqlite' 'python-sqlalchemy'
#              'python-starlette' 'python-requests')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('c409d08908a2645e53bec5436c6050f0d3b488ef8d14952aa21e753deec02c75e7234ffe00917249604f43a4d4afd2f13040368ab3c3efa239647653e273fd1e')

# TODO: fix tests (need databases)

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

#check() {
#  cd $_pkgname-$pkgver
#
#  python setup.py pytest
#}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
