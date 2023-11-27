# Maintainer:

pkgname=jellyfin-web
pkgver=10.8.12
pkgrel=1
pkgdesc='Web client for Jellyfin'
arch=('any')
url='https://jellyfin.org'
_url='https://github.com/jellyfin/jellyfin-web'
license=('GPL2')
makedepends=('git' 'nodejs' 'npm')
_commit='4b6bbcfe2671b21a79e347241eed3c70acaad9e3'
source=("$pkgname::git+$_url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # download dependencies
  # FS#79713 - remove environment variable with 10.9.x release
  SKIP_PREPARE=1 npm ci --no-audit --no-fund --no-update-notifier
}

build() {
  cd "$pkgname"

  npm run build:production
}

package() {
  cd "$pkgname"

  install -vd "$pkgdir/usr/share/$pkgname"
  cp -vr dist/* "$pkgdir/usr/share/$pkgname"
}

# vim: ts=2 sw=2 et:
