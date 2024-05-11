# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=aiomysql
pkgname=python-$_pkgname
pkgver=0.2.0
pkgrel=2
pkgdesc='library for accessing a MySQL database from the asyncio'
arch=('any')
url='https://github.com/aio-libs/aiomysql'
license=('MIT')
depends=('python' 'python-pymysql')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools' 'python-setuptools-scm')
optdepends=('python-sqlalchemy: SQLAlchemy support')
#checkdepends=('python-pytest' 'python-ipdb' 'python-docker' 'python-sqlalchemy' 'python-uvloop')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('8816556455036d0f247a663f1e508a3b9845f68b94723255cddfb9afc89dae796054a9aad712452e37e8d784bb97be8722dc87e98f8380fa924626343bbcf295')

prepare() {
  # remove the use of python-setuptools-scm-git-archive: https://github.com/aio-libs/aiomysql/pull/872
  sed -e '/setuptools_scm_git_archive/d' -e 's/, < 7//' -i $_pkgname-$pkgver/pyproject.toml
}

build() {
  cd $_pkgname-$pkgver

  python -m build -nw
}

## NOTE: most tests require a running mysql instance
#check() {
#  cd $_pkgname-$pkgver
#
#  python -m pytest
#}

package() {
  cd $_pkgname-$pkgver

  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
