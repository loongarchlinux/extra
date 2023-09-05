# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Matmas <matmas@matmas.net>
# Contributor: Thomas Gubler <thomasgubler@gmail.com>
# Contributor: Daniel YC Lin <dlin.tw at gmail>
# Contributor: Florian Bruhin <archlinux.org@the-compiler.org>

pkgname=python-websocket-client
pkgver=1.6.2
pkgrel=1
pkgdesc="WebSocket client library for Python"
arch=('any')
url="https://github.com/websocket-client/websocket-client"
license=('LGPL')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/w/websocket-client/websocket-client-$pkgver.tar.gz")
sha512sums=('51ba53a916c7716c3c017606c108a434a97042658b829518dbe2307a0f0b568a79d68a8b382a3e8530972f51a418f109546773cbc8872c05fa099fcbfb00d261')

build() {
  cd websocket-client-$pkgver
  python setup.py build
}

check() {
  cd websocket-client-$pkgver
  pytest
}

package() {
  cd websocket-client-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 ft=sh et:
