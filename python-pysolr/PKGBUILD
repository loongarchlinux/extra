# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pysolr
pkgname=python-pysolr
pkgver=3.9.0
pkgrel=7
pkgdesc="Python Solr client"
arch=(any)
url="https://github.com/django-haystack/pysolr"
license=(BSD-3-Clause)
depends=(
  python
  python-setuptools
  python-requests
)
makedepends=(
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
)
optdepends=(
  'python-kazoo: for solrcloud'
  'python-simplejson: for JSON support'
  'solr: for interfacing a local solr instance'
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('340a15a9cb14504bf76f11187493e6ae909223b039e79acfb672b797193c41703174c006d394cd6cacdb891c224d326c826d8258ef9451bd2befc2842edcdde0')
b2sums=('92e7e29d9e756e79cae28764acaa820991c4bb74e8903f9234f8ca868c330c93d0e8c119c5311260009ca0ea175af9753b1cccf53fd789da3aadd16f3b6de096')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

# NOTE: tests vendor solr *and* zookeeper (including download)

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,{CHANGELOG,README}.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
