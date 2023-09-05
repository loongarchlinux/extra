# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Romain Gautier <romain.gautier@nimamoh.com>

pkgname=kotlin
pkgver=1.9.10
pkgrel=1
pkgdesc='Statically typed programming language that can interoperate with Java'
arch=(any)
url='https://kotlinlang.org/'
license=(APACHE custom)
depends=('java-environment>=8')
makedepends=(setconf)
source=("https://github.com/JetBrains/kotlin/releases/download/v${pkgver/_/-}/kotlin-compiler-${pkgver/_/-}.zip")
sha512sums=('1a92e8e9f9e1a8cff0f1e3bd652beed67b0d3d5081800a08f7c0deba520d05c83a13a698776361f96bf7cce389171ac49fcc10d74cea56b89500e8b90a9220a4')
b2sums=('02a73a17c0be80a83fd9ab1a6087391b62d981d452f8a6cb43c62b6f7226713c965058988b9d1fed32a5e039ef2617c5362357428d04cd92d4ec0ab04078732c')

prepare() {
  cd ${pkgname}c/bin

  setconf kotlin      DIR         /usr/bin
  setconf kotlinc-js  DIR         /usr/bin
  setconf kotlinc-jvm DIR         /usr/bin
  setconf kotlinc     KOTLIN_HOME /usr/share/$pkgname
}

package() {
  cd ${pkgname}c

  # executables
  install -Dm755 -t "$pkgdir/usr/bin" bin/kotlin
  install -Dm755 -t "$pkgdir/usr/bin" bin/kotlinc
  install -Dm755 -t "$pkgdir/usr/bin" bin/kotlinc-js
  install -Dm755 -t "$pkgdir/usr/bin" bin/kotlinc-jvm

  # jar files
  cd lib
  install -d "$pkgdir/usr/share/$pkgname/lib"
  for jar in *.jar; do
    install -Dm644 "$jar" "$pkgdir/usr/share/$pkgname/lib"
  done

  # licenses
  cd "$srcdir/${pkgname}c/license"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 NOTICE.txt "$pkgdir/usr/share/licenses/$pkgname"
  for txt in third_party/*.txt; do
    install -Dm644 "$txt" "$pkgdir/usr/share/licenses/$pkgname"
  done

  # build.txt must be installed for for "-version" to work
  cd $srcdir/${pkgname}c
  install -Dm644 build.txt "$pkgdir/usr/share/$pkgname"
}

# getver: github.com/JetBrains/kotlin/releases/latest
