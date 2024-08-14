# Maintainer: Jerome Leclanche <jerome@leclan.ch>

pkgname=xonsh
pkgver=0.17.0
pkgrel=1
pkgdesc="Python-powered, cross-platform, Unix-gazing shell"
url="https://xon.sh/"
arch=("any")
license=("BSD")
depends=("python" "python-ply" "python-setproctitle")
optdepends=("python-prompt_toolkit: support for SHELL_TYPE=prompt_toolkit")
makedepends=("python-setuptools" "python-wheel")
source=("https://github.com/xonsh/xonsh/archive/$pkgver/$pkgname-$pkgver.tar.gz")
install=xonsh.install
sha256sums=('7a7ad21eb6831ed09e2949cd65282f6e84c7406179f031706d8a41eeb6919a81')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir"
  install -Dm644 license "$pkgdir/usr/share/licenses/$pkgname/license"
}
