# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-crispy-forms
pkgname=python-django-crispy-forms
pkgver=2.1
pkgrel=2
pkgdesc="The best way to have DRY Django forms"
arch=(any)
url="https://github.com/django-crispy-forms/django-crispy-forms"
license=(MIT)
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
checkdepends=(
  python-crispy-bootstrap3
  python-crispy-bootstrap4
  python-pytest
  python-pytest-django
)
optdepends=(
  'python-crispy-bootstrap3: for a bootstrap 3 theme pack'
  'python-crispy-bootstrap4: for a bootstrap 4 theme pack'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('703f353adc272905b4d5ebe21ea54e3016a3889703bf406dfdf92638dac2e6f536cf1bc16022be6a442f7dfa962ff17746edea591cf80c2be9440d9bb50a9dcc')
b2sums=('3f38830f370efde04494add3ddd2ce7f4a04b032b9aad770ba30885ed2b3a14cff3c748fa299041c9c1d7007b30eb55c96a46fe496c0432b187ae72879d4240e')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PWD:$PYTHONPATH"
  DJANGO_SETTINGS_MODULE=tests.test_settings pytest -vv tests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CONTRIBUTORS.txt,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
