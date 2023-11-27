# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>

pkgname=bash-bats-assert
pkgver=2.1.0
pkgrel=1
pkgdesc="Common assertions for Bats"
arch=("any")
url="https://github.com/bats-core/bats-assert"
license=("custom:CC0")
depends=('bash-bats-support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bats-core/bats-assert/archive/v$pkgver.tar.gz")
sha512sums=('797689b91df5018b717c09578e1c0f6fea11f344c2e5985ec5eaca89bab39aafa7d88b31043a34576bcdf0ab5cf160c9624ee3167bd0854d7b16aa947b3928e4')

check() {
  cd bats-assert-$pkgver
  BATS_LIB_PATH=/usr/lib bats test
}

package() {
  cd bats-assert-$pkgver

  for fn in *.bash; do
    install -Dm755 $fn \
      "$pkgdir"/usr/lib/bats-assert/$(basename $fn)
  done

  for fn in src/*.bash; do
    install -Dm755 $fn \
      "$pkgdir"/usr/lib/bats-assert/src/$(basename $fn)
  done

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
