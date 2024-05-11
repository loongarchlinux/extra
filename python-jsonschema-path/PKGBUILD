# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-jsonschema-path
pkgver=0.3.2
pkgrel=3
pkgdesc="JSONSchema Spec with object-oriented paths"
url="https://github.com/p1c2u/jsonschema-path"
license=('Apache')
arch=('any')
depends=('python-pathable' 'python-yaml' 'python-requests' 'python-referencing')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest' 'python-responses')
source=("https://github.com/p1c2u/jsonschema-path/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e49b32c4609238d2808938976bd0022f86837e9d7d296a137d42f8e8c80d20d20fdd23a07b898063536290b36bd72df0abef64b65997a66cb3fb9c403cc275d3')

prepare() {
  cd jsonschema-path-$pkgver
  sed -i '/--cov/d' pyproject.toml
}

build() {
  cd jsonschema-path-$pkgver
  python -m build -wn
}

check() {
  cd jsonschema-path-$pkgver
  PYTHONPATH="$PWD" pytest
}

package() {
  cd jsonschema-path-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
}
