# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-openapi-schema-validator
# https://github.com/p1c2u/openapi-schema-validator/releases
pkgver=0.6.2
pkgrel=2
pkgdesc="OpenAPI schema validation for Python"
url="https://github.com/p1c2u/openapi-schema-validator"
# https://github.com/python-openapi/openapi-schema-validator/blob/0.6.2/pyproject.toml#L36
license=('BSD-3-Clause')
arch=('any')
depends=('python' 'python-jsonschema' 'python-jsonschema-specifications' 'python-rfc3339-validator')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest')
source=("https://github.com/p1c2u/openapi-schema-validator/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "jsonschema-4.19.2.patch")
sha256sums=('db0215a89bc1f65d69b2e122142a122feb868339748fc12c72be72292f432638'
            '8a0682c41a9a7b8c53d7feb334ce945f626087ca2fa49634b61edbbc308053ba')

prepare() {
  cd openapi-schema-validator-$pkgver
  sed -i '/--cov/d' pyproject.toml
  patch -Np1 -i ../jsonschema-4.19.2.patch
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
