# Maintainer: Jiachen YANG <farseerfc@gmail.com>
# AUR Contributor: juantascon <juantascon.aur@horlux.org>
# Contributor : Jingbei Li <i@jingbei.li>

pkgname=plantuml
pkgver=1.2023.13
pkgrel=1
pkgdesc="Component that allows to quickly write uml diagrams"
arch=(any)
url="https://plantuml.com/"
license=('GPL')
depends=("java-runtime>=8" "bash")
makedepends=("gradle" "java-environment>=8")
source=("https://github.com/plantuml/plantuml/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.run")
sha256sums=('b9f470171a732210e26c65dd6268eeb30e4262a9b3cdea784893ea5679be500d'
            'a3fb528f4c719cfd0ff6154c60fd54ce341011d132caf950cc30af4989f6aac8')
optdepends=('plantuml-ascii-math: allow use AsciiMath or JLaTeXMath notation'
            'ditaa: allow use ditaa notation'
            'graphviz: allow use Graphviz/DOT notation')

prepare(){
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  gradle jar
}

package() {
  depends+=("java-runtime")
  install -m 755 -D "$pkgname.run" "$pkgdir/usr/bin/$pkgname"

  cd "$srcdir/$pkgname-$pkgver"
  install -m 644 -D "build/libs/$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
}
