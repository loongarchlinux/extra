# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-haystack
_name="${pkgname#python-}"
pkgver=3.3.0
pkgrel=1
pkgdesc="Modular search for Django"
arch=(any)
url="https://github.com/django-haystack/django-haystack"
license=(BSD-3-Clause)
depends=(
  python
  python-django
  python-packaging
)
makedepends=(
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-dateutil
  python-elasticsearch
  python-geopy
  python-pysolr
  python-requests
  python-whoosh
)
optdepends=(
  'python-elasticsearch: interface with an elasticsearch instance as search backend'
  'python-pysolr: interface with a solr instance as search backend'
  'python-whoosh: use whoosh as search backend'
  'python-xapian-haystack: use python-xapian as search backend'
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('f8fb6fe11957391d4dc48f279c07e29b2063c7268a4585c4d2d0462f9b17d3563997a29bed4da5577b4125e70668aa79ce86a553cda71cb94c1af19b9bd808fe')
b2sums=('d6193172f5baae90792a636f925f5d9eb6f886f362fcb36f4551dcf0e097fbb2ef58bd7a7bb8dc8401846df3eea4601566e58495f6ab8ce99b4498b8d9b55196')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver/
  python test_haystack/run_tests.py
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,CONTRIBUTING.md,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
