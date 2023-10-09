# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-openapi-schema-validator
# https://github.com/p1c2u/openapi-schema-validator/releases
pkgver=0.6.1
pkgrel=1
pkgdesc="OpenAPI schema validation for Python"
url="https://github.com/p1c2u/openapi-schema-validator"
license=('BSD')
arch=('any')
depends=('python' 'python-jsonschema' 'python-jsonschema-specifications' 'python-rfc3339-validator')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest')
source=("https://github.com/p1c2u/openapi-schema-validator/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1d70ad3322051d5bb140923ca609dae7b44a367ba158aa0841f08087ebaf14b9')

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
