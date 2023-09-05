# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-ignore-flaky
pkgver=2.0.0
pkgrel=1
pkgdesc="Ignore failures from flaky tests (pytest plugin)"
arch=('any')
license=('MIT')
url="https://github.com/schettino72/pytest-ignore-flaky/"
depends=('python-pytest')
makedepends=('python-setuptools')
source=("https://github.com/schettino72/pytest-ignore-flaky/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('1ec45d083e990ab85e9011d4c0cbf4ffc1d0d26526e1363efd82605d415e27bc63cd3826f34880bdf2965eb6e12b3fae4ebe460e4508260635101173c34f1707')

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
