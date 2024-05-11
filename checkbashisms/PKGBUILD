# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=checkbashisms
pkgver=2.23.7
pkgrel=1
pkgdesc='Debian script that checks for bashisms'
arch=('any')
url='https://tracker.debian.org/pkg/devscripts'
license=('GPL-2.0-or-later')
depends=('perl')
source=("https://salsa.debian.org/debian/devscripts/-/archive/v$pkgver/devscripts-v$pkgver.tar.gz")
sha512sums=('c610e6b45541b06a09521cb5861d875d724d22e6dce32df4e34493fe6d10d8a569500a8d9aaf626409243724d6e5a894046b53d09ef3ce2f6e7a47504ce668e2')
b2sums=('d61a989d3294be1dd2f92400a6e608e5672c0fa19bf65a7ad60c635ebd3b5d286caaec27eefb7a317344bd57ed2baede33b45f6c24a9f490d730a99104c65899')

prepare() {
  cd "devscripts-v$pkgver/scripts"

  sed "s/###VERSION###/$pkgver/g" checkbashisms.pl > checkbashisms
}

package() {
  cd "devscripts-v$pkgver/scripts"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "$pkgname"

  # man page
  install -vDm644 -t "$pkgdir/usr/share/man/man1" "$pkgname.1"

  # bash completions
  install -vDm644 "$pkgname.bash_completion" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}
