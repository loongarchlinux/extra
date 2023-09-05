# Maintainer: Jonathan Steel <jsteel@aur.archlinux.org>
# Contributor: Justin Davis <jrcd83@gmail.com>

pkgname=perl-sub-exporter
pkgver=0.990
pkgrel=2
pkgdesc="A sophisticated exporter for custom-built routines"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-data-optlist' 'perl-params-util' 'perl-sub-install')
url="https://metacpan.org/release/Sub-Exporter"
source=(https://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Sub-Exporter-$pkgver.tar.gz)
sha512sums=('49cc16efe0e44a5d8d1aa49bd2f35ebb43640ce27030d480e1acae1da13444a877007f7eb924d6e3743691222505d646744cc651fbd09850cd965673fac2d92b')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB="" \
      PERL_AUTOINSTALL="--skipdeps"            \
      PERL_MM_OPT="INSTALLDIRS=vendor"         \
      PERL_MB_OPT="--installdirs vendor"       \
      MODULEBUILDRC=/dev/null

    cd "$srcdir"/Sub-Exporter-$pkgver

    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""

    cd "$srcdir"/Sub-Exporter-$pkgver

    make test
  )
}

package() {
  cd "$srcdir"/Sub-Exporter-$pkgver

  make DESTDIR="$pkgdir"/ install
}
