# Maintainer: David Runge <dvzrv@archlinux.org>

_name=crispy-bootstrap4
pkgname=python-crispy-bootstrap4
pkgver=2024.1
pkgrel=3
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
sha512sums=('c4c4e02117a2b3cf24c9111579c20f1454c5feb8c485c954e48436354e82d0a26e34b54212fb642d010a7c370236028119e5193fdb43ff2053cabae56a01a7c2')
b2sums=('5778544067c7c23971a410bb52556a267fed9109bee4b5a4cd7e72c9bde0888e6744c2e12aa079c92217c0b6bc0ef2709de2eae127fe92ccc92ca1acb5015aa6')

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
