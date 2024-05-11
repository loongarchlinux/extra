# Maintainer: David Runge <dvzrv@archlinux.org>

_name=crispy-bootstrap3
pkgname=python-crispy-bootstrap3
pkgver=2024.1
pkgrel=3
pkgdesc="Bootstrap3 template pack for django-crispy-forms"
arch=(any)
url="https://github.com/django-crispy-forms/crispy-bootstrap3"
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
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('abcdfbb76d8e4c44e9b1444245fced252cd933af09a0d905bb760602684fe004')
b2sums=('40a90ab97755e72a5e46dfcb7a2763bf21acbb5bb53117c92fa419bcc52d2faf46e189d0b00003c09d1c0d835979a137299f3b7b3a503548efc38e4507415791')

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
