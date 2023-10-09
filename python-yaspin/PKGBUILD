# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-yaspin
pkgver=2.4.0
pkgrel=1
pkgdesc="Yet Another Terminal Spinner"
url="https://github.com/pavdmyt/yaspin"
license=('MIT')
arch=('any')
depends=('python-termcolor')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest')
source=("https://github.com/pavdmyt/yaspin/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e23efda78551d58f7907ee9347ddcbf8aa75a86ded3e8b31ff38b316a8179e81ff5ec0d280384995384cbe743f5f1da4cffb16f217378638de587839c88eb3c5')

build() {
  cd yaspin-$pkgver
  python -m build --no-isolation --wheel
}

check() {
  cd yaspin-$pkgver
  python -m pytest
}

package() {
  cd yaspin-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
