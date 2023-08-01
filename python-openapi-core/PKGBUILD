# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=python-openapi-core
_pipname=openapi_core
pkgver=0.18.0
pkgrel=1
pkgdesc='Client-side and server-side support for the OpenAPI Specification v3'
arch=(any)
url='https://github.com/p1c2u/openapi-core'
license=(BSD)
depends=(python-openapi-spec-validator python-werkzeug python-isodate python-more-itertools)
makedepends=(python-build python-installer python-poetry-core)
source=(https://pypi.io/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz)
sha256sums=('ede9fe3a2b0a7f8870249c085b2d7e64b7bb169b46ceeaa3b812cceff2b05548')

build() {
  cd $_pipname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pipname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
