# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: François Charette <firmicus ατ gmx δοτ net>

pkgname=perl-datetime-timezone
pkgver=2.62
pkgrel=1
pkgdesc="Time zone object base class and factory "
arch=(any)
url="https://search.cpan.org/dist/DateTime-TimeZone"
license=('GPL' 'PerlArtistic')
depends=('perl-class-singleton>=1.03' 'perl-params-validate>=0.72' 'perl-class-load'
	 'perl-list-allutils')
options=('!emptydirs')
source=(https://www.cpan.org/CPAN/authors/id/D/DR/DROLSKY/DateTime-TimeZone-$pkgver.tar.gz)
sha256sums=('6214f9c9c8dfa2000bae912ef2b8ebc5b163a83a0b5b2a82705162dad63466fa')

build() {
  cd  "$srcdir"/DateTime-TimeZone-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd  "$srcdir"/DateTime-TimeZone-$pkgver
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
