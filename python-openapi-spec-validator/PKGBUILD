# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-openapi-spec-validator
# https://github.com/p1c2u/openapi-spec-validator/releases
pkgver=0.6.0
pkgrel=1
pkgdesc="OpenAPI 2.0 (aka Swagger) and OpenAPI 3 spec validator"
url="https://github.com/p1c2u/openapi-spec-validator"
license=('Apache')
arch=('any')
depends=('python' 'python-jsonschema' 'python-openapi-schema-validator'
         'python-jsonschema-spec' 'python-lazy-object-proxy')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/p1c2u/openapi-spec-validator/archive/$pkgver.tar.gz")
sha512sums=('b0154492b3a1e932b11204d6018e2a744adfd5887a6e60b056dcd06762d1acb2dfe27000c2ed264aa8e99852d3d8da2718fcddff581414f2e3dc351cb027fb47')

prepare() {
  cd openapi-spec-validator-$pkgver
  sed -i '/--cov/d' pyproject.toml
}

build() {
  cd openapi-spec-validator-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd openapi-spec-validator-$pkgver
  PYTHONPATH="$PWD" pytest
}

package() {
  cd openapi-spec-validator-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
