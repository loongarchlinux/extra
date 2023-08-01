# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-openapi-schema-validator
# https://github.com/p1c2u/openapi-schema-validator/releases
pkgver=0.6.0
pkgrel=1
pkgdesc="OpenAPI schema validation for Python"
url="https://github.com/p1c2u/openapi-schema-validator"
license=('BSD')
arch=('any')
depends=('python' 'python-jsonschema' 'python-jsonschema-specifications' 'python-rfc3339-validator')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest')
source=("https://github.com/p1c2u/openapi-schema-validator/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('9a005a91c6d2fc1769632d1583d9e4e82d36144e4ec745c794ca2ec3a4db817d')

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
