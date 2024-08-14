# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Douglas Soares de Andrade
# Contributor: Roberto Alsina <ralsina@kde.org>

_pkgname=mechanize
pkgname=python-mechanize
pkgver=0.4.10
pkgrel=1
epoch=1
pkgdesc='Stateful programmatic web browsing in Python'
arch=('any')
url="https://github.com/python-mechanize/mechanize"
license=('BSD')
depends=('python-html5lib')
makedepends=('python-setuptools' 'git')
checkdepends=('python-zope-interface' 'python-twisted')
optdepends=('python-html5-parser: faster parsing of HTML')
source=("git+$url#tag=v$pkgver?signed")
sha256sums=('b95bf4c8312e76e4d9a7834d320aad87b172978645d3f52d19b802c6b53d2b7d')
b2sums=('165387a0acfb73d8ade57996bff0feed8ac8ee16fa479a5dc5d02b4f523e53c780f61598aa435326be9446c7e795d9ff9641661bcb2e5dd32cdfa0b437af76f2')
validpgpkeys=('3CE1780F78DD88DF45194FD706BC317B515ACE7C') # Kovid Goyal (New longer key) <kovid@kovidgoyal.net>

prepare() {
  cd $_pkgname
}

build() {
  cd $_pkgname

  python setup.py build
}

check() {
  cd $_pkgname

  python run_tests.py
}

package() {
  cd $_pkgname

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
