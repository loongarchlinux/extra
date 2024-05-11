# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-appconf
pkgname=python-django-appconf
pkgver=1.0.6
pkgrel=2
pkgdesc="An app to handle configuration defaults of packaged Django apps gracefully"
arch=(any)
url="https://github.com/django-compressor/django-appconf"
license=(BSD-3-Clause)
depends=(
  python
  python-django
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('c8d20703d7344ac0f5281fdad1c1b2d80059f601687a54c3278f5d343ee73561f58c59a93ff37bf01b856f9d5b7f283602a07d8de2c553b394a9c7527fd7bbe8')
b2sums=('43f3690c37eb1279fd37bc0468e21737433210e87f8eb27790a6979105335c002804c4d589c9b611051f1f29f3c72804b0faf9b8af6d39a4cdefd1fb1a8fb59c')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="$PWD:build:$PYTHONPATH"
  DJANGO_SETTINGS_MODULE=tests.test_settings django-admin test -v2 tests
  rm -rf tests/__pycache__
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
