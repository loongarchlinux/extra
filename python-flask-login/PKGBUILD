# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-flask-login
pkgver=0.6.3
pkgrel=4
pkgdesc="User session management for Flask"
arch=('any')
url="https://pythonhosted.org/Flask-Login/"
license=('MIT')
depends=('python' 'python-flask' 'python-werkzeug')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-nose' 'python-blinker' 'python-semantic-version' 'python-asgiref')
source=("https://github.com/maxcountryman/flask-login/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c421f85387b9ba0ba2ad98053cae596dd9bf6119c0a366d2b13c483d4fbf45afc0c0e4d46f35368f42fa088398ace9a0a0aab931826d8612d94f55b95afef71b')

build() {
  cd flask-login-$pkgver
  python -m build --wheel --no-isolation
}

# Tests unsupported with flask 2.0+
# https://github.com/maxcountryman/flask-login/issues/747
# check() {
#   cd flask-login-$pkgver
#   nosetests3
# }

package() {
  cd flask-login-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
}
