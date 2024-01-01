# Maintainer:

pkgname=jellyfin-web
pkgver=10.8.13
pkgrel=1
pkgdesc='Web client for Jellyfin'
arch=('any')
url='https://jellyfin.org'
_url='https://github.com/jellyfin/jellyfin-web'
license=('GPL2')
makedepends=('git' 'nodejs' 'npm')
_commit='8e37078b6066715b27fd2dde1f7d1eda216044d9'
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
