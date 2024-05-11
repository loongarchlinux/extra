# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-emoji
pkgver=2.11.1
pkgrel=1
pkgdesc="Emoji for Python"
url="https://github.com/carpedm20/emoji"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
source=("git+https://github.com/carpedm20/emoji.git#tag=v$pkgver")
sha512sums=('a9f28b5b5b0ada129cf3d6a8be4dfad439ac34882e30cd89ce178638b433f1c5a31156b6067d80484586449e615a8b7a1f84dbf307a0141cb2a798558d9c19d7')

build() {
  cd emoji
  python setup.py build
}

check() {
  cd emoji
  pytest
}

package() {
  cd emoji
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
