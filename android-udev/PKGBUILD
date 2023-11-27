# Maintainer: M0Rf30
# Contributor: marlock

pkgname=android-udev
pkgver=20231104
pkgrel=1
pkgdesc='Udev rules to connect Android devices to your linux box'
arch=(any)
url='https://github.com/M0Rf30/android-udev-rules'
license=(GPL3)
depends=(udev libmtp)
source=(android-udev-$pkgver.zip::https://github.com/M0Rf30/android-udev-rules/archive/$pkgver.zip)
sha1sums=('3d0a05168ea2b6c11e003a39ce84acc853c5229c')
sha256sums=('2ce37d1fadec72bcbcc371a6e7af21f08a0e748bf91a25cfa4114e1c94cc394d')

package() {
  cd android-udev-rules-$pkgver
  install -Dm 644 51-android.rules "$pkgdir"/usr/lib/udev/rules.d/51-android.rules
  install -Dm 644 android-udev.conf "$pkgdir"/usr/lib/sysusers.d/android-udev.conf
}
