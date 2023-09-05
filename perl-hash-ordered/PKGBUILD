# Maintainer:

pkgname=perl-hash-ordered
pkgver=0.014
pkgrel=2
pkgdesc='A fast, pure-Perl ordered hash class'
arch=(any)
license=(PerlArtistic GPL)
depends=(perl)
makedepends=()
checkdepends=(perl-test-deep perl-test-failwarnings perl-test-fatal)
options=(!emptydirs)
url='https://github.com/dagolden/Hash-Ordered'
source=(https://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Hash-Ordered-$pkgver.tar.gz)
sha256sums=('8dc36cd79155ae37ab8a3de5fd9120ffba9a31e409258c28529ec5251c59747b')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd Hash-Ordered-$pkgver
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd Hash-Ordered-$pkgver

  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd Hash-Ordered-$pkgver
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
