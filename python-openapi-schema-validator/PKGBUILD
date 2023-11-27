# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-openapi-schema-validator
# https://github.com/p1c2u/openapi-schema-validator/releases
pkgver=0.6.2
pkgrel=1
pkgdesc="OpenAPI schema validation for Python"
url="https://github.com/p1c2u/openapi-schema-validator"
license=('BSD')
arch=('any')
depends=('python' 'python-jsonschema' 'python-jsonschema-specifications' 'python-rfc3339-validator')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest')
source=("https://github.com/p1c2u/openapi-schema-validator/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('db0215a89bc1f65d69b2e122142a122feb868339748fc12c72be72292f432638')

prepare() {
  cd openapi-schema-validator-$pkgver
  sed -i '/--cov/d' pyproject.toml
}

build() {
  cd openapi-schema-validator-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd openapi-schema-validator-$pkgver
  python -m pytest
}

package() {
  cd openapi-schema-validator-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
