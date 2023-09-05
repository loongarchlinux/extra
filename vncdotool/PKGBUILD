# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=vncdotool
pkgver=1.2.0
pkgrel=1
pkgdesc='A command line VNC client'
arch=('any')
url='https://github.com/sibson/vncdotool'
license=('MIT')
depends=('python-pillow' 'python-twisted' 'python-zope-interface')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/sibson/vncdotool/archive/v$pkgver.tar.gz)
sha512sums=('88ee299e59e303c77bd82d43bb10ce99d8b2d4257e9f1a0ab5d1460cda23c55246bb8c81d3ee3ea0da56a858cff0fca12c9019c39d7952e2bf7f40048ddf526e')

package() {
    cd $pkgname-$pkgver

    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
