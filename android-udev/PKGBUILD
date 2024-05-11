# Maintainer: M0Rf30
# Contributor: marlock

pkgname=android-udev
pkgver=20240221
pkgrel=1
pkgdesc='Udev rules to connect Android devices to your linux box'
arch=(any)
url='https://github.com/M0Rf30/android-udev-rules'
license=(GPL3)
depends=(udev libmtp)
source=(android-udev-$pkgver.zip::https://github.com/M0Rf30/android-udev-rules/archive/$pkgver.zip)
sha1sums=('8cf393d053999f1eb6da706b43b6764dc68e2f7b')
sha256sums=('66f7e14c57d597c60eae21901ef7b76e9bc4e253f5cc252717293b6b94788279')

package() {
  cd android-udev-rules-$pkgver
  install -Dm 644 51-android.rules "$pkgdir"/usr/lib/udev/rules.d/51-android.rules
  install -Dm 644 android-udev.conf "$pkgdir"/usr/lib/sysusers.d/android-udev.conf
}
