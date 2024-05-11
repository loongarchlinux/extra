# Maintainer: Sébastien Luttringer
# Contributor: Jonathan Steel <mail at jsteel dot org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>

pkgname=virtualbox-guest-iso
pkgver=7.0.18
pkgrel=1
pkgdesc='The official VirtualBox Guest Additions ISO image'
arch=('any')
url='https://www.virtualbox.org/'
license=('GPL2')
install=virtualbox-guest-iso.install
replaces=('virtualbox-additions' 'virtualbox-iso-additions')
conflicts=('virtualbox-additions' 'virtualbox-iso-additions')
noextract=(VBoxGuestAdditions_$pkgver.iso)
source=("https://download.virtualbox.org/virtualbox/$pkgver/VBoxGuestAdditions_$pkgver.iso")
sha256sums=('4469bab0f59c62312b0a1b67dcf9c07a8a971afad339fa2c3eb80e209e099ef9')

package() {
  install -D -m 0644 VBoxGuestAdditions_$pkgver.iso \
    "$pkgdir/usr/lib/virtualbox/additions/VBoxGuestAdditions.iso"
}
