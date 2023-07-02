# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-net-dns
pkgver=1.39
pkgrel=1
pkgdesc="Perl Module: Interface to the DNS resolver"
arch=('any')
license=('PerlArtistic')
url="https://search.cpan.org/dist/Net-DNS/"
depends=('perl-digest-hmac' 'perl-net-ip')
checkdepends=('perl-test-pod' 'perl-mime-base32' 'perl-net-dns-sec' 'perl-net-libidn2')
optdepends=('perl-io-socket-inet6: IPv6 support'
            'perl-socket6: IPv6 support'
            'perl-net-libidn2: non-ASCII domain support')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/N/NL/NLNETLABS/Net-DNS-$pkgver.tar.gz")
sha512sums=('3df05765bab4479fc2b78fbaa7cd90ecbe34f015423876fc751198b1a924c39ce0be134999cf3b783a7eb1f7e519e661aa31593a39c1d0236e7f298fab34bd6f')

build() {
  cd Net-DNS-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Net-DNS-$pkgver
  make test
}

package() {
  cd Net-DNS-$pkgver
  make DESTDIR="$pkgdir" install
}
