# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

_pkgbase=send2trash
pkgname=python-send2trash
pkgver=1.8.2
pkgrel=1
pkgdesc="Send file to trash natively"
arch=('any')
url="https://github.com/hsoft/send2trash"
license=('BSD')
depends=('python')
makedepends=('python' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hsoft/$_pkgbase/archive/$pkgver.tar.gz")
sha256sums=('0fc5e578a8f5c34455dd76e26909e73ea61250d796d23e36804999d4318cd5c2')

build() {
	cd $_pkgbase-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $_pkgbase-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
