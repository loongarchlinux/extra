# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Justin Davis (juster) <jrcd83@gmail.com>

pkgname=perl-mozilla-ca
pkgver=20240313
pkgrel=1
pkgdesc="Mozilla's CA cert bundle in PEM format (using system CA store)"
arch=('any')
license=('GPL2' 'LGPL2.1')
options=('!emptydirs')
depends=('perl' 'ca-certificates')
url='https://metacpan.org/release/Mozilla-CA'
source=("https://search.cpan.org/CPAN/authors/id/L/LW/LWP/Mozilla-CA-$pkgver.tar.gz")
sha512sums=('b5666f30a483e0abeb04182d8c02e8d3c3457672debf628152f3566ed7f5fc4942d7ac186b14802cd549d35abe2fc93cd505373d8a9af77fee57a2948d9a4984')

prepare() {
  cd Mozilla-CA-$pkgver
  # Use system CA store. Replacing the copy in the source tree so the test suite is actually run against it.
  ln -sf /etc/ssl/certs/ca-certificates.crt lib/Mozilla/CA/cacert.pem
}

build() {
  cd Mozilla-CA-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Mozilla-CA-$pkgver
  make test
}

package() {
  cd Mozilla-CA-$pkgver
  make install DESTDIR="$pkgdir"

  # Replace CA store here again because the symlink was installed as a file
  ln -sf /etc/ssl/certs/ca-certificates.crt "$pkgdir"/usr/share/perl5/vendor_perl/Mozilla/CA/cacert.pem
}

# vim:set ts=2 sw=2 et:
