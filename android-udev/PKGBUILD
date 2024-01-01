# Maintainer: M0Rf30
# Contributor: marlock

pkgname=android-udev
pkgver=20231124
pkgrel=1
pkgdesc='Udev rules to connect Android devices to your linux box'
arch=(any)
url='https://github.com/M0Rf30/android-udev-rules'
license=(GPL3)
depends=(udev libmtp)
source=(android-udev-$pkgver.zip::https://github.com/M0Rf30/android-udev-rules/archive/$pkgver.zip)
sha1sums=('0f5849e19dd4c6191c2fb4f7cb2a2a3ee91065b2')
sha256sums=('2e36147ca5bf182d3e34894c48a0d13eeee0697183fd6dae1446b4b886aa1cc6')

package() {
  cd android-udev-rules-$pkgver
  install -Dm 644 51-android.rules "$pkgdir"/usr/lib/udev/rules.d/51-android.rules
  install -Dm 644 android-udev.conf "$pkgdir"/usr/lib/sysusers.d/android-udev.conf
}
