# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

_name=TypeScript
pkgname=typescript
pkgver=5.3.2
pkgrel=1
pkgdesc='JavaScript with syntax for types'
arch=('any')
url=http://www.typescriptlang.org
license=('Apache')
depends=('nodejs')
makedepends=('git' 'npm' 'rsync')
source=("git+https://github.com/microsoft/$_name.git#tag=v$pkgver")
b2sums=('SKIP')

prepare() {
  cd $_name
  npm ci
}

build() {
  cd $_name
  npx hereby LKG
}

check() {
  cd $_name
  npm run test
}

package() {
  install -d "$pkgdir"/usr/{bin,lib/node_modules/$pkgname}
  ln -s ../lib/node_modules/$pkgname/bin/{tsc,tsserver} "$pkgdir"/usr/bin

  cd $_name
  rsync -r --exclude=.gitattributes README.md SECURITY.md bin lib package.json \
    "$pkgdir"/usr/lib/node_modules/$pkgname
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname ThirdPartyNoticeText.txt
}
