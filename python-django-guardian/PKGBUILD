# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-guardian
_name="${pkgname#python-}"
pkgver=2.4.0
pkgrel=5
pkgdesc="Per object permissions for Django"
arch=(any)
url="https://github.com/django-guardian/django-guardian"
license=(
  BSD-2-Clause
  MIT
)
depends=(
  python
  python-django
  python-django-environ
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-django
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('820dad68d0a7aa5b907803a3b7be2daf3f9d811dc51efcd1adc3c151f1468749943a0ce35514b83d7a64a4d2851ea2eca1581df928f516902a3cf38bca88c6be')
b2sums=('ce53b605f49e4671cd997a45f8fb8d605bed28693a7920e08a9269fe8ef9831864a5a234b927fee87db4d0c29a496c117f1f154d3e42b806eaafdf7bab444f51')

prepare() {
  sed -n '1,23p' $_name-$pkgver/LICENSE > BSD-2-Clause.txt
  sed -n '20,50p' $_name-$pkgver/LICENSE > MIT.txt
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  pytest -v
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,CHANGES,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 ../*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
