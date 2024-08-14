# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: François Charette <firmicus ατ gmx δοτ net>

pkgname=perl-datetime-locale
pkgver=1.43
pkgrel=1
pkgdesc="Localization support for DateTime.pm "
arch=(any)
url="https://search.cpan.org/dist/DateTime-Locale"
license=('GPL' 'PerlArtistic')
depends=('perl-params-validate' 'perl-list-moreutils'
	 'perl-file-sharedir' 'perl-file-sharedir-install')
options=('!emptydirs')
source=(https://www.cpan.org/authors/id/D/DR/DROLSKY/DateTime-Locale-$pkgver.tar.gz)
sha256sums=('6c859c17cf274749dfc2c6aaf6bf4b492b605fabdddd23712efbbd5caf601de1')

build() {
  cd  "$srcdir"/DateTime-Locale-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd  "$srcdir"/DateTime-Locale-$pkgver
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
