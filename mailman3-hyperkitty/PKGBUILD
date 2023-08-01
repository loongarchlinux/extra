# Maintainer: David Runge <dvzrv@archlinux.org>

_name=mailman-hyperkitty
pkgname=mailman3-hyperkitty
pkgver=1.2.1
_commit=8a31ec14a8f3517d42a44f4d57a7f20a5489275d  # refs/tags/1.2.1
pkgrel=3
pkgdesc="Mailman plugin to archive emails with HyperKitty"
arch=(any)
url="https://gitlab.com/mailman/mailman-hyperkitty"
license=(GPL3)
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
  git+$url#tag=$_commit?signed
  $pkgname.tmpfiles
)
sha512sums=('SKIP'
            'bc97105a6208d951cbb884a18fea9f1aeb94cb1dab5966ef707c4af526d6bcf869c6c75321fa834f66ca20d315f73a071bb62aba9353c320d7ba84ba935cce6b')
b2sums=('SKIP'
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
