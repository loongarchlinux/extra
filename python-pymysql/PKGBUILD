# Maintainer: David Runge <dvzrv@archlinux.org>

_name=PyMySQL
pkgname=python-pymysql
pkgver=1.1.0
pkgrel=1
pkgdesc="Pure Python MySQL Client"
arch=(any)
url="https://github.com/PyMySQL/PyMySQL/"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  mariadb
  python-pytest
)
optdepends=(
  'mariadb: for using a local MariaDB instance'
  'python-cryptography: for RSA cryptography'
  'python-pynacl: for ed25519 cryptography'
)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('51dddc92e766183ab5d93717121d853415561dc81abc7ec8299a73610cae5bc22b6070006d6ea24405ab31bc1ea68be61466a3477c0f84d47435f78ffc60d31e')
b2sums=('f793d8d409c9bf4316ac13cd249e63d2d11aaa929c30e90b603265308a4704d6ec58c6f5b412bf3f6328b0bc80326e0dce41b8aee7baa55111df177d4634a0cc')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

# NOTE: tests require a running instance of mariadb
# check() {
#   local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

#   cd $_name-$pkgver
#   python -m installer --destdir=test_dir dist/*.whl
#   export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
#   pytest -vv
# }

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGELOG,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
