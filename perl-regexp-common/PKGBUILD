# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: yaroslav <proninyaroslav@mail.ru>
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>

pkgname=perl-regexp-common
pkgver=2024080801
pkgrel=1
pkgdesc="Commonly requested regular expressions"
arch=('any')
url="https://metacpan.org/release/Regexp-Common"
license=('PerlArtistic' 'Artistic2.0' 'BSD' 'MIT')
depends=('perl')
options=('!emptydirs')
source=(https://cpan.metacpan.org/authors/id/A/AB/ABIGAIL/Regexp-Common-$pkgver.tar.gz)
sha256sums=('0677afaec8e1300cefe246b4d809e75cdf55e2cc0f77c486d13073b69ab4fbdd')

build() {
  cd Regexp-Common-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Regexp-Common-$pkgver
  make test
}

package() {
  cd Regexp-Common-$pkgver
  make DESTDIR="$pkgdir" install

  # We have a sale on licenses; grab yours today!
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYRIGHT*
}

# vim:set ts=2 sw=2 et:
