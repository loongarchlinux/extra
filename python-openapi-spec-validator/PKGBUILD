# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-openapi-spec-validator
# https://github.com/p1c2u/openapi-spec-validator/releases
pkgver=0.7.1
pkgrel=2
pkgdesc="OpenAPI 2.0 (aka Swagger) and OpenAPI 3 spec validator"
url="https://github.com/p1c2u/openapi-spec-validator"
license=('Apache')
arch=('any')
depends=('python' 'python-jsonschema' 'python-openapi-schema-validator'
         'python-jsonschema-path' 'python-lazy-object-proxy')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/p1c2u/openapi-spec-validator/archive/$pkgver.tar.gz")
sha512sums=('2a57ae1beb5f38f278839749f80cd92881bb57aa035573e604ee5fad5db6868150a9b4ebd1c00c20cc0fa00672619f5d99295de4df3173d25a841fe25c374c9d')

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
