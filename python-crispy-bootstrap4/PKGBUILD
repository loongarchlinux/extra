# Maintainer: David Runge <dvzrv@archlinux.org>

_name=crispy-bootstrap4
pkgname=python-crispy-bootstrap4
pkgver=2023.1
pkgrel=1
pkgdesc="Bootstrap4 template pack for django-crispy-forms"
arch=(any)
url="https://github.com/django-crispy-forms/crispy-bootstrap4"
license=(MIT)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-django
  python-django-crispy-forms
  python-pytest
  python-pytest-django
)
source=($url/archive/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('fbbc8c6e0f4351b50b0fa3a4d2faefb0775906c995f42cf9ccd9688d4780e05877a9a53f065ad92785d135a560064809f429dbcebe9f257f65f063d9539973e8')
b2sums=('0a3c4c1b86ba9701365f1fcfb90811e1f6793fb9f374a510410c460bc62a48e06b72a75330f0efd3a06e51380f457eea66f236488774c3ee6bf758510136f08b')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PWD:$PYTHONPATH"
  pytest -vv tests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGELOG,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
