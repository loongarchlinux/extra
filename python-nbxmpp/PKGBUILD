# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=python-nbxmpp
pkgdesc="A Python library to use Jabber/XMPP networks in a non-blocking way"
pkgver=4.3.1
pkgrel=1
arch=(any)
url="https://dev.gajim.org/gajim/python-nbxmpp/"
license=(GPL3)
depends=(libsoup3 python-gobject python-idna python-precis_i18n)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://dev.gajim.org/gajim/python-nbxmpp/-/archive/$pkgver/python-nbxmpp-$pkgver.tar.gz")
sha256sums=('89f56f2495e93d6a55dd9d4981136e2c3b7a3e19ffa11377146695b1ec21102c')
b2sums=('43d9af2c3c6d3737d01eba11e2128a0c687ee63c13a508f549aa6f67ba141550e655c493cff151dcfd0f891ce2cca5b4df0806e4a873e6f62743a7f5ae6def6f')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
