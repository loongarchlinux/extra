# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Diogo Ferreira <diogo@underdev.org>

pkgname=cloc
pkgver=2.02
pkgrel=1
pkgdesc="Count lines of code"
arch=('any')
url="https://github.com/AlDanial/cloc"
license=('GPL-2.0-or-later')
depends=('perl' 'perl-algorithm-diff' 'perl-regexp-common'
         'perl-parallel-forkmanager')
source=(https://github.com/AlDanial/cloc/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('0f77f4255c14186b6c82672b44f829192a78fe4e8a8ac8a60dbc8342e132b78a')

package() {
  cd $pkgname-$pkgver/Unix
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
