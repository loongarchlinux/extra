# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
# Maintainer: Jonas Witschel <diabonas@archlinux.org>

pkgname=python-aiohttp-socks
pkgver=0.8.2
_tag=c6cba8d62da795d43752432967b66619a02a93f9 # git rev-parse "v$pkgver"
pkgrel=1
pkgdesc="SOCKS proxy connector for aiohttp. SOCKS4(a) and SOCKS5 are supported."
arch=('any')
url="https://github.com/romis2012/aiohttp-socks/"
license=('Apache')
depends=('python' 'python-aiohttp' 'python-python-socks')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-flask' 'python-pytest' 'python-pytest-asyncio' 'python-trustme' 'python-anyio' 'python-tiny-proxy')
source=("git+https://github.com/romis2012/aiohttp-socks.git?signed#tag=$_tag")
sha256sums=('SKIP')
validpgpkeys=('706A8935FED55F3BFB7C188B5EEAD7400A5D80ED') # Roman Snegirev (maintainer)

pkgver() {
	cd "${pkgname//python-}"
	git describe | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    cd "${pkgname//python-}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgname//python-}"
    pytest
}

package() {
    cd "${pkgname//python-}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
