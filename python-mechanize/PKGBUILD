# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Douglas Soares de Andrade
# Contributor: Roberto Alsina <ralsina@kde.org>

_pkgname=mechanize
pkgname=python-mechanize
pkgver=0.4.8
pkgrel=3
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
sha256sums=('SKIP')
b2sums=('SKIP')
validpgpkeys=('3CE1780F78DD88DF45194FD706BC317B515ACE7C') # Kovid Goyal (New longer key) <kovid@kovidgoyal.net>

prepare() {
  cd $_pkgname
  #  Fix check failure with python 3.11
  git cherry-pick -n 529d2c4cb8f31284f8026642968ba3adb9de1171 # Use asserts for failing test so we get better feedback on the failure
  git cherry-pick -n 7ba3d586368c03577c061c35bc27664a907f5435 # DRYer
  git cherry-pick -n 560839d51e54943890c2d37c0d0854792479cb80 # Change test to not rely on order of cookie iteration
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
