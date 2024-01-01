# Maintainer: Jerome Leclanche <jerome@leclan.ch>

pkgname=xonsh
pkgver=0.14.3
pkgrel=1
pkgdesc="Python-powered, cross-platform, Unix-gazing shell"
url="https://xon.sh/"
arch=("any")
license=("BSD")
depends=("python" "python-ply" "python-setproctitle")
optdepends=("python-prompt_toolkit: support for SHELL_TYPE=prompt_toolkit")
makedepends=("python-setuptools" "python-wheel")
source=("https://github.com/xonsh/xonsh/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
install=xonsh.install
sha256sums=('b80ed0f670c04e64e9be6a609024dec467428520c08ad6b53608e412531e015d')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir"
  install -Dm644 license "$pkgdir/usr/share/licenses/$pkgname/license"
}
