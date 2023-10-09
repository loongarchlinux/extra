# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Charles Mauch <cmauch@gmail.com>

pkgname=perl-authen-sasl
pkgver=2.1700
pkgrel=1
pkgdesc="Perl/CPAN Module Authen::SASL : SASL authentication framework"
arch=(any)
url="https://search.cpan.org/dist/Authen-SASL"
license=("GPL" "PerlArtistic")
source=("https://cpan.metacpan.org/authors/id/E/EH/EHUELS/Authen-SASL-$pkgver.tar.gz")
sha256sums=('b86d5a576b8d387aee24f39f47a54afd14bb66b09003db5065001f1de03a8ece')

build() {
  cd "$srcdir"/Authen-SASL-$pkgver
  PERL_USE_UNSAFE_INC=1 \
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir"/Authen-SASL-$pkgver
  make pure_install doc_install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
