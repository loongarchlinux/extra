# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname='perl-mail-message'
pkgver=3.015
pkgrel=1
pkgdesc="container for MIME-encoded message information"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-user-identity' 'perl-mailtools' 'perl-mime-types'
	 'perl-io-stringy' 'perl-uri' 'perl-hash-ordered')
makedepends=()
url='https://search.mcpan.org/dist/Mail-Message'
source=("https://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/Mail-Message-$pkgver.tar.gz")
sha256sums=('b2858d7f877d3ed489f83404a40aaa95dd96ef61e00f141aef149a332399b25a')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/Mail-Message-$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/Mail-Message-$pkgver"

  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/Mail-Message-$pkgver"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
