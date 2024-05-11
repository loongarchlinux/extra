# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-click-didyoumean
pkgver=0.3.1
pkgrel=2
pkgdesc="Enable git-like did-you-mean feature in click"
url="https://github.com/click-contrib/click-didyoumean"
license=('MIT')
arch=('any')
depends=('python-click')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest')
source=("git+https://github.com/click-contrib/click-didyoumean.git#tag=v$pkgver")
sha512sums=('02299c69be937e090c6b6723e71e7b169755aa45e123bc2281357e8cb197917cc05f162a3cdeffa13c9c1310222a744c4022c7f594e16c107036390cb41989f8')

build() {
  cd click-didyoumean
  python -m build -nw
}

check() {
  cd click-didyoumean
  PYTHONPATH="$PWD/src" pytest
}

package() {
  cd click-didyoumean
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
