# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-ignore-flaky
pkgver=2.1.0
pkgrel=1
pkgdesc="Ignore failures from flaky tests (pytest plugin)"
arch=('any')
license=('MIT')
url="https://github.com/schettino72/pytest-ignore-flaky/"
depends=('python-pytest')
makedepends=('python-setuptools')
source=("https://github.com/schettino72/pytest-ignore-flaky/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('250413f4ca8c67c1280dacee679e7ea91b3408d6076b7dd7f4aadd7d3294229b34f5794747b7658bb08b043ba547a48af053c5c328b74e229db357025f52b839')

build() {
  cd pytest-ignore-flaky-$pkgver
  python setup.py build
}

check() {
  cd pytest-ignore-flaky-$pkgver
  python setup.py egg_info
  export PYTHONPATH="src:${PYTHONPATH}"
  pytest
}

package() {
  cd pytest-ignore-flaky-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
