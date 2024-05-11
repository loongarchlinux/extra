# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Johannes Dewender   arch at JonnyJD dot net

pkgname=python-discid
pkgver=1.2.0
pkgrel=9
pkgdesc="Python binding of MusicBrainz libdiscid"
url="https://github.com/JonnyJD/python-discid"
license=(LGPL-3.0-or-later)
arch=(any)
depends=(
  libdiscid
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('239cb608508e94109aa9b8b582bc3de1fb9408b508d56698d7f17ec9ebb0d37c1fb76557d98b6d194c1532e3047efcde3adc5d6e9634bc87533d331423a7f19f')
b2sums=('616613de23b66adfc92227a9f36b710649f2a419ffd83443766ebcf1dbfaf528b7d933011bcbdcd19f5092726b81e40d905a62a64262a528dfad89e561210992')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  # disable tests relying on /dev/cdrom:
  # https://github.com/JonnyJD/python-discid/issues/51
  pytest -v -k "not test_read_features and not test_read_put and not test_read_simple"
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
