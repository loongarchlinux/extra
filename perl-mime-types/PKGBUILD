# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jan de Groot
# Contributor: Charles Mauch <cmauch@gmail.com>

pkgname=perl-mime-types
pkgver=2.26
pkgrel=1
pkgdesc="Perl/CPAN Module MIME::Types : Information and processing MIME types"
arch=('any')
url="https://search.cpan.org/dist/MIME-Types/"
license=('PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MA/MARKOV/MIME-Types-$pkgver.tar.gz")
sha512sums=('cde3a8c6cbde16143732cf2ac4d648eff167917970357daf0162370cbba375b2aa546af472a73b2a4b26086919ddcc49bd9da999251946a40aee8abb60af2d75')

build() {
  cd MIME-Types-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd MIME-Types-$pkgver
  make test
}

package() {
  cd MIME-Types-$pkgver
  make DESTDIR="${pkgdir}" install
}
