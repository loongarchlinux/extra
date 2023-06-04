# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=vncdotool
pkgver=1.1.0
pkgrel=1
pkgdesc='A command line VNC client'
arch=('any')
url='https://github.com/sibson/vncdotool'
license=('MIT')
depends=('python-pillow' 'python-twisted' 'python-zope-interface')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/sibson/vncdotool/archive/v$pkgver.tar.gz)
sha512sums=('41b237da92ffad5855bb0806a6e797e8f62a979b283b3c30e6713e591da785a1fad39c3660535cc0498a2a8b3f3d1545bcf90aec6d7b987b18e7abf3bd89d962')

package() {
    cd $pkgname-$pkgver

    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
