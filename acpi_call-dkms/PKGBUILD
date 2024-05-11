# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: mortzu <me@mortzu.de>
# Contributor: fnord0 <fnord0@riseup.net>

pkgname=acpi_call-dkms
pkgver=1.2.2
pkgrel=2
pkgdesc='A linux kernel module that enables calls to ACPI methods through /proc/acpi/call - module sources'
url='https://github.com/nix-community/acpi_call'
arch=('any')
license=('GPL')
depends=('dkms')
makedepends=('git')
provides=("acpi_call=${pkgver}-${pkgrel}")
conflicts=('acpi_call')
source=("git+https://github.com/nix-community/acpi_call.git#tag=v${pkgver}"
        'dkms.conf')
b2sums=('ad709e39995bddb1f603b493ca502ac327402057509c9609de25e09a0094ea930d356555a905211e4e6b6b3fca701ff41ba3d99532d5df7fe30d282d00b596b1'
        '504da1102e778fe54368e990408dbef02f5b2ce91f683d170f3d6a1a2f9349d00d61dcbddd0262a8dfc958ea0964135ba58d8dd88ac06bd10b5e13b90f11faef')

package() {
  install -D -m0644 acpi_call/{Makefile,acpi_call.c} dkms.conf -t "${pkgdir}"/usr/src/acpi_call-${pkgver}
  echo acpi_call | install -D -m0644 /dev/stdin "${pkgdir}"/usr/lib/modules-load.d/acpi_call.conf
  install -d -m0755 "${pkgdir}"/usr/share/acpi_call
  cp -dr --no-preserve=ownership acpi_call/{examples,support} "${pkgdir}"/usr/share/acpi_call/
}

# vim: ts=2 sw=2 et:
