# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=perl-lwp-protocol-https
pkgver=6.14
pkgrel=1
pkgdesc="Provide https support for LWP::UserAgent"
arch=('any')
url="https://metacpan.org/release/LWP-Protocol-https"
license=('PerlArtistic' 'GPL')
depends=('ca-certificates' 'perl-io-socket-ssl' 'perl-net-http' 'perl-libwww')
checkdepends=('perl-test-requiresinternet' 'perl-test-needs')
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/LWP-Protocol-https-$pkgver.tar.gz")
sha512sums=('8f220c307833a803a8539a1c794598097133f24017edda9030eba2ff558d54104040fbae64d7068e99b9e03142e6e96a8b11c478e2a5571e908754a385b59fab')

build() {
  cd LWP-Protocol-https-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd LWP-Protocol-https-$pkgver
  make test
}

package() {
  cd LWP-Protocol-https-$pkgver
  make DESTDIR="$pkgdir" install
}
