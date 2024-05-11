# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-aresponses
pkgver=3.0.0
pkgrel=2
pkgdesc="Asyncio http mocking. Similar to the responses library used for 'requests'"
url="https://github.com/aresponses/aresponses"
license=('MIT')
arch=('any')
depends=('python-aiohttp' 'python-pytest-asyncio')
makedepends=('python-setuptools')
checkdepends=('python-pytest-cov')
source=("https://github.com/aresponses/aresponses/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('92788bf7ba469cac7ef6f22b7a49cb5880ed48b975b3dc16362638fd7c80c8401600e53fc36ad0c1507c0be734f3a46547b320762b7b2c77bf900729da53642d')

build() {
  cd aresponses-$pkgver
  python setup.py build
}

check() {
  cd aresponses-$pkgver
  python -m pytest
}

package() {
  cd aresponses-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
