# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Francois Charette <firmicus@gmx.net>

pkgname=perl-xml-rss
pkgver=1.63
pkgrel=1
pkgdesc="Parse or create Rich Site Summaries (RSS)"
arch=('any')
url="https://search.cpan.org/dist/XML-RSS"
license=('GPL' 'PerlArtistic')
depends=('perl-datetime' 'perl-datetime-format-mail' 'perl-datetime-format-w3cdtf'
	 'perl-html-parser' 'perl-xml-parser')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-RSS-$pkgver.tar.gz)
sha256sums=('bc010a4afdf6d5bade39774dc338eb982b95319db3eadd1b3d79b41ec1c9dce1')

build() {
  cd  "$srcdir"/XML-RSS-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd  "$srcdir"/XML-RSS-$pkgver
  make install DESTDIR="$pkgdir"
}
