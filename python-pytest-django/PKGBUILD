# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-django
pkgver=4.8.0
_commit=49b98d184e89ea68da0ee14e1ddb3fd4dbb72ddd
pkgrel=2
pkgdesc="A Django plugin for py.test"
arch=('any')
license=('BSD')
url="https://github.com/pytest-dev/pytest-django"
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm'
             'python-wheel')
checkdepends=('python-django' 'python-pytest-xdist')
source=("git+https://github.com/pytest-dev/pytest-django.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd pytest-django
  python -m build -nw
}

check() {
  # Hack entry points by installing it

  cd pytest-django
  python -m installer -d tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH:$PWD" \
  DJANGO_SETTINGS_MODULE=pytest_django_test.settings_sqlite \
    pytest tests
}

package() {
  cd pytest-django
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm664 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
