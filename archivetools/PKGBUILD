# Maintainer: Sébastien Luttringer

pkgname=archivetools
pkgver=4
pkgrel=1
pkgdesc='Arch Linux Archive Tools'
arch=('any')
url='https://gitlab.archlinux.org/archlinux/archivetools'
license=('GPL-2.0-or-later')
depends=('rsync' 'hardlink' 'xz' 'util-linux' 'systemd' 'bash')
makedepends=('git')
backup=('etc/archive.conf')
source=("git+https://gitlab.archlinux.org/archlinux/archivetools.git#tag=v$pkgver")
sha256sums=('93e36e9a84f52da3572b8e594f62bc388ce468ea376e8bbfc2e78d995f6f8c56')

package() {
  cd $pkgname
  install -Dm644 archive.conf "$pkgdir/etc/archive.conf"
  install -Dm755 archive.sh "$pkgdir/usr/bin/archive"
  install -Dm755 archive-cleaner -t "$pkgdir/usr/bin"
  # systemd stuff
  install -Dm644 archive.sysusers "$pkgdir/usr/lib/sysusers.d/archive.conf"
  install -Dm644 archive.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/archive.conf"
  for _p in archive.{timer,service} archive-hardlink.{timer,service}; do
    install -Dm644 $_p "$pkgdir/usr/lib/systemd/system/$_p"
  done
}

# vim:set ts=2 sw=2 et:
