# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: François Charette <firmicus ατ gmx δοτ net>

pkgname=perl-math-round
pkgver=0.08
pkgrel=1
pkgdesc="Perl extension for rounding numbers"
arch=('any')
url="https://search.cpan.org/dist/Math-Round"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("https://www.cpan.org/authors/id/N/NE/NEILB/Math-Round-$pkgver.tar.gz")
sha256sums=('7b4d2775ad3b859a5fd61f7f3fc5cfba42b1a10df086d2ed15a0ae712c8fd402')

build() {
  cd  "${srcdir}/Math-Round-${pkgver}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd  "${srcdir}/Math-Round-${pkgver}"
  make test
}

package() {
  cd  "${srcdir}/Math-Round-${pkgver}"
  make install DESTDIR="${pkgdir}"

  find "${pkgdir}" -name '.packlist' -delete
  find "${pkgdir}" -name '*.pod' -delete
}
