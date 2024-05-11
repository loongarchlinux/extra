# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Guillaume Alaux <guillaume@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=eclipse-ecj
pkgver=4.31
pkgrel=2
_date=202402290520
pkgdesc='Eclipse java bytecode compiler'
arch=(any)
license=(EPL)
url=https://www.eclipse.org/
source=(
  https://archive.eclipse.org/eclipse/downloads/drops4/R-${pkgver}-${_date}/ecj-${pkgver}.jar
  https://archive.eclipse.org/eclipse/downloads/drops4/R-${pkgver}-${_date}/checksum/eclipse-${pkgver}-SUMSSHA512
  ecj
)
sha512sums=('1f31bea2297013601ba7a3e0a8c65d7b621601c106fe10bf2a11af625d63aa0772941fa029fb392cd9fe2314203e6ef7e04a94dc938e15961108494139fae3e8'
            '5783ad3466afc3ad776d5ee416c4fb4806bb020bd1001cb1b80996089e4a6d0c3882836e80841c39638d3402431a993c7259d14e569edd5032462b69e3505b79'
            '1895c12c63262a08a2c889bb1db61308b5cb8846e5f20e584cde6878afd4da5ee051045a61a0a5a4498146a7315c8a14bf120e5d369365f4efc573d371381846')

prepare() {
  local _source_file_sum=$(grep -m 1 ecj-${pkgver}.jar eclipse-${pkgver}-SUMSSHA512 | cut -d ' ' -f 1)
  if [[ "${sha512sums[0]}" != "${_source_file_sum}" ]]; then
    msg "Checksums do not match"
    exit 1
  fi
}

package() {
  depends=(java-runtime)

  install -Dm 644 ecj-${pkgver}.jar "${pkgdir}"/usr/share/java/eclipse-ecj-${pkgver}.jar
  ln -s eclipse-ecj-${pkgver}.jar "${pkgdir}"/usr/share/java/ecj.jar
  ln -s eclipse-ecj-${pkgver}.jar "${pkgdir}"/usr/share/java/eclipse-ecj.jar
  install -Dm 755 ecj -t "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
