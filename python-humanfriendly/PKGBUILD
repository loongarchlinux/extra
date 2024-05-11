# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-humanfriendly
pkgver=10.0
pkgrel=8
pkgdesc="Human friendly input/output for text interfaces using Python"
arch=(any)
url="https://github.com/xolox/python-humanfriendly"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-docutils
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('a0f324aa3af27088b77bd68c1d2ee65090ca6ace71414ae698452bc2a81de82f82f8d53b47145ea9822b93e600da3b871e9244a9681d06b54fa2c31efc2857ef')
b2sums=('0e133bc4f871455f9aa20f542a9a5be83a47db07865b44cb53f2ba093425925404ab91d5019322a9a25448362b83cc040bdf1502c200022dd0a23c423799ee8f')

prepare() {
  # replace use of mock with unittest.mock
  # disable tests requiring even more dead capturer project
  sed -e 's/from mock import/from unittest.mock import/;s/test_terminal_cap/off_test_terminal_cap/; s/test_prompt_for_conf/off_test_prompt_for_conf/; s/test_generate_warning/off_test_generate_warning/' -i $pkgname-$pkgver/${pkgname#python-}/tests.py
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  python -m unittest discover -v ${pkgname#python-}/
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGELOG,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
