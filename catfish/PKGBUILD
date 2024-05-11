# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Alexander Fehr <pizzapunk@gmail.com>
# Contributor: Pantelis Panayiotou <p.panayiotou@gmail.com>
# Contributor: loqs <bugs-archlinux@entropy-collector.net>

pkgname=catfish
pkgver=4.18.0
pkgrel=2
pkgdesc='Versatile file searching tool'
arch=('any')
url='https://docs.xfce.org/apps/catfish/start'
license=('GPL')
depends=('dbus-python' 'gtk3' 'python-cairo' 'python-gobject' 'python-pexpect' 'xdg-utils'
         'xfconf' 'which')
makedepends=('intltool' 'python-distutils-extra' 'python-setuptools')
optdepends=('mlocate: search in locate index'
            'zeitgeist: search in zeitgeist index')
source=("https://archive.xfce.org/src/apps/catfish/${pkgver%.*}/$pkgname-$pkgver.tar.bz2")
sha256sums=('fdae9b73cc754a50716bb04b958aa31dbd7e94047068b7207f2ae313a7d58b99')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package () {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
