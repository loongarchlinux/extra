# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>

pkgname=perl-image-info
pkgver=1.44
pkgrel=1
pkgdesc="Extract meta information from image files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='https://search.cpan.org/dist/Image-Info'
source=(https://search.cpan.org/CPAN/authors/id/S/SR/SREZIC/Image-Info-$pkgver.tar.gz)
sha256sums=('cb7fc65dd1effe01eb47c1c79a52dd1654f428e3a97db1ef23b126ce01636f0d')

build() {
  cd "$srcdir"/Image-Info-$pkgver
  export PERL_MM_USE_DEFAULT=1
  perl Makefile.PL INSTALLDIRS=vendor
  make
  make test
}

package() {
  cd "$srcdir"/Image-Info-$pkgver
  make DESTDIR="${pkgdir}/" install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
