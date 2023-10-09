# Maintainer:

pkgname=jellyfin-web
pkgver=10.8.11
pkgrel=1
pkgdesc='Web client for Jellyfin'
arch=('any')
url='https://jellyfin.org'
_url='https://github.com/jellyfin/jellyfin-web'
license=('GPL2')
makedepends=('git' 'nodejs' 'npm')
_commit='1e1af1c67fd42ed6a9497734fbc32de452a37be0'
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
