# Maintainer: David Runge <dvzrv@archlinux.org>

_name=mailman-hyperkitty
pkgname=mailman3-hyperkitty
pkgver=1.2.1
pkgrel=4
pkgdesc="Mailman plugin to archive emails with HyperKitty"
arch=(any)
url="https://gitlab.com/mailman/mailman-hyperkitty"
license=(GPL-3.0-or-later)
depends=(
  mailman3
  python
  python-requests
  python-zope-interface
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-nose2)
replaces=(python-mailman-hyperkitty-plugin)
backup=(etc/mailman-hyperkitty.cfg)
source=(
  git+$url?signed#tag=$pkgver
  $pkgname.tmpfiles
)
sha512sums=('26f2f45f797bb357c8c1abffcbcd8a179e57a2157aad8806d2d6627f7924579fbd2069f9c20e9c3139ca1b669c441befaa5fd269da3c9f7108b8a81d7afb5d02'
            'bc97105a6208d951cbb884a18fea9f1aeb94cb1dab5966ef707c4af526d6bcf869c6c75321fa834f66ca20d315f73a071bb62aba9353c320d7ba84ba935cce6b')
b2sums=('3b916f56b13951eeaafc076a5776c56fbbf3124ba1699aacd25281ebc8576476fe73213eb0f60c9f011bd10fbcfe1f08652979946a44ebf01cf85a1cacd3f30d'
        '973b3ef36a3707fdefb36a94a7b5d4a2556f1dfd0d1c70fc648b90226203d33e488d8b79526b837a99ab0acbd4562894b8b62fe84021485180e03f9a874e66bf')
validpgpkeys=('541EA0448453394FF77A0ECC9D9B2BA061D0A67C')  # Abhilash Raj <raj.abhilash1@gmail.com>

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  cd $_name
  nose2 -v
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 640 $_name.cfg -t "$pkgdir/etc/"
  install -vDm 644 ../$pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
