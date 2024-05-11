# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-lazy-fixtures
pkgver=1.0.7
pkgrel=2
pkgdesc="Use fixtures in @pytest.mark.parametrize"
arch=(any)
url="https://github.com/dev-petrov/pytest-lazy-fixtures"
license=(MIT)
depends=(python python-pytest)
makedepends=(python-build python-installer python-poetry-core)
source=(https://github.com/dev-petrov/pytest-lazy-fixtures/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('a5f918446cde27ff569300b2d0f53fcb30d139537a0b069f7ee20a79229da0bd')

build() {
  cd pytest-lazy-fixtures-$pkgver
  python -m build -nw
}

check() {
  cd pytest-lazy-fixtures-$pkgver
  PYTHONPATH="$PWD" pytest -p pytest_lazy_fixtures.plugin
}

package() {
  cd pytest-lazy-fixtures-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
