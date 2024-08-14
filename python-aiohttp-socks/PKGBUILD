# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
# Contributor: Jonas Witschel <diabonas@archlinux.org>

pkgname=python-aiohttp-socks
pkgver=0.9.0
pkgrel=1
pkgdesc="SOCKS proxy connector for aiohttp. SOCKS4(a) and SOCKS5 are supported."
arch=('any')
url="https://github.com/romis2012/aiohttp-socks"
license=('Apache-2.0')
depends=('python' 'python-aiohttp' 'python-python-socks' 'python-async-timeout')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-flask' 'python-pytest' 'python-pytest-asyncio' 'python-trustme' 'python-anyio' 'python-tiny-proxy')
source=("git+$url.git?signed#tag=v$pkgver")
b2sums=('7535c4ff5a1987480d4a0faa007769c1218d484df7f7b649d8f11ab4436162bc03295647db95cf5dc1fb76d33e87d34a39fddd631fa3b4d93ae55201ed26c488')
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
