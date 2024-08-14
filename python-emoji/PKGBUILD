# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-emoji
pkgver=2.12.1
pkgrel=1
pkgdesc="Emoji for Python"
url="https://github.com/carpedm20/emoji"
license=('BSD')
arch=('any')
depends=('python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/carpedm20/emoji.git#tag=v$pkgver")
sha512sums=('d469aec4e1af99735658b5dc17ae90fb4038975847b97ec05b290b09e0ce67842e937dc14f67c1d1860756fba6a37ba354eafea3372327c603538d14d90b45f9')

build() {
  cd emoji
  python -m build -nw
}

check() {
  cd emoji
  pytest
}

package() {
  cd emoji
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
