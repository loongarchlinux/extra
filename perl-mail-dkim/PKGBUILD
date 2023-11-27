# Maintainer: Florian Pritz <bluewind@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Francois Charette <firmicus@gmx.net>

pkgname=perl-mail-dkim
pkgver=1.20230911
pkgrel=1
pkgdesc='Signs/verifies Internet mail with DKIM/DomainKey signatures'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl-crypt-openssl-rsa perl-cryptx perl-mail-authenticationresults
         perl-mailtools perl-net-dns)
checkdepends=('perl>=5.6' perl-net-dns perl-net-dns-resolver-mock
              perl-test-requiresinternet perl-yaml-libyaml)
url=https://metacpan.org/release/Mail-DKIM
source=("https://cpan.metacpan.org/authors/id/M/MB/MBRADSHAW/Mail-DKIM-$pkgver.tar.gz")
md5sums=(2a141454c7ee5199116302600ca3bbdb)
sha512sums=(d89a4412e6352602d5eec9ca435b2c13dd06aa5c639fd357608f8788b9ba8b2dafe0c064bc48928ac040e19d144a48cedd07cecf7c0caa623b0d39845133ee80)
_ddir="Mail-DKIM-$pkgver"

build()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  unset PERL5LIB PERL_MM_OPT
  /usr/bin/perl Makefile.PL
  make
)

check()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1
  unset PERL5LIB
  make test
)

package()
(
  cd "$srcdir/$_ddir"
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
