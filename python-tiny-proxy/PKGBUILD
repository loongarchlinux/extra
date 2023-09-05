# Maintainer:

_pyname=tiny-proxy
pkgname=python-$_pyname
pkgver=0.2.0
pkgrel=1
pkgdesc='Simple proxy server (SOCKS4(a), SOCKS5(h), HTTP tunnel)'
arch=(any)
url='https://github.com/romis2012/tiny-proxy'
license=(Apache)
depends=(python-anyio)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-trustme python-aiohttp python-httpx)
source=(https://github.com/romis2012/tiny-proxy/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('04080b5047ff4d3eb2fcc195be02d03d11aa96d36f770a75e84395c28fcd34f5')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

# Need more AUR dependencies
#check() {
#  cd $_pyname-$pkgver
#  python -m venv --system-site-packages test-env
#  test-env/bin/python -m installer dist/*.whl
#  test-env/bin/python -m pytest
#}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
