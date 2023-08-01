# Maintainer: M0Rf30
# Contributor: marlock

pkgname=android-udev
pkgver=20230614
pkgrel=1
pkgdesc='Udev rules to connect Android devices to your linux box'
arch=(any)
url='https://github.com/M0Rf30/android-udev-rules'
license=(GPL3)
depends=(udev libmtp)
source=(android-udev-$pkgver.zip::https://github.com/M0Rf30/android-udev-rules/archive/$pkgver.zip)
sha1sums=('e3675bbb6d583262ff492c4a85de44a9118da420')
sha256sums=('5482d7e5dc7f301e6af3b2d533e950ef6083efc7eec3f93cd9a905885a412049')

package() {
  cd android-udev-rules-$pkgver
  install -Dm 644 51-android.rules "$pkgdir"/usr/lib/udev/rules.d/51-android.rules
  install -Dm 644 android-udev.conf "$pkgdir"/usr/lib/sysusers.d/android-udev.conf
}
