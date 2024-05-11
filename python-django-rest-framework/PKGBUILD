# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-rest-framework
_name="${pkgname#python-}"
pkgver=3.15.1
pkgrel=3
pkgdesc="A powerful and flexible toolkit for building Web APIs."
arch=(any)
url="https://www.django-rest-framework.org/"
_url="https://github.com/encode/django-rest-framework"
license=(BSD-3-Clause)
depends=(
  python
  python-django
  python-pytz
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
optdepends=(
  'python-django-filter: for dynamic queryset filters'
  'python-django-guardian: for a per-object permission model'
  'python-markdown: for markdown support'
  'python-psycopg2: for PostgreSQL support'
  'python-pygments: for syntax highlighting'
  'python-yaml: for YAML support'
)
source=($_name-$pkgver.tar.gz::$_url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('e44c3d861973928194035364fb6b5ddffbcacab959072b2c549971dd6675b5a5f1be13b55856154dbffaefb48dcbd4a63fd9ffbce5456507b52fd5e4648706b9')
b2sums=('daf672a1fb01494f08dd54af7369bd464d4fc1e22ff3c90c0fe787408d4f327710c5e6394e33546a4df2da752dbd774980f092108f2f4e395795af3aead18f89')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv -c /dev/null
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
