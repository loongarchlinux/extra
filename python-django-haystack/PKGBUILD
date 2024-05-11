# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-haystack
_name="${pkgname#python-}"
pkgver=3.2.1
pkgrel=4
pkgdesc="Modular search for Django"
arch=(any)
url="https://github.com/django-haystack/django-haystack"
license=(BSD-3-Clause)
depends=(
  python
  python-django
)
makedepends=(
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  gdal
  python-dateutil
  python-elasticsearch
  python-geopy
  python-nose
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
sha512sums=('3d7dc23bf9a65062626f2860da009fdffb7cdd81cbed4f521ff00047f4d96f25702ffab032bf5d8605502b1825f1c82f867ea796583b7bf0c94ef96699a00135')
b2sums=('cfdeec43014955c7b2e9ac988691c3102a752c75f3b87a57d20360c0e57db92afaff20413510f8405f0a3c8b246532aa54c3e9b1953ea32e10bc252dc3793f0f')

prepare() {
  # remove useless version pinning
  sed -e 's/==/>=/g' -i $_name-$pkgver/setup.py
}

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  local nose_options=(
    --exclude=test_more_like_this
    --exclude=test_pagination
    --exclude=test_search_query
    # broken with pytest 8
    --exclude=test_values
    --exclude=test_valueslist
    --exclude=test_repr
    --exclude=test_values_sqs
    --exclude=test_valueslist_sqs
    --cover-package=haystack
    --cover-erase
    --verbose
  )

  cd $_name-$pkgver/test_haystack/
  nosetests "${nose_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,CONTRIBUTING.md,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
