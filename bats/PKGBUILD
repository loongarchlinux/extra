# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Andre Schröder <andre.schroedr at gmail dot com>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>

pkgname=bats
pkgver=1.10.0
pkgrel=3
pkgdesc='Bash Automated Testing System'
url='https://github.com/bats-core/bats-core'
arch=(any)
license=(MIT)
depends=(
  bash
  coreutils
  ncurses
  parallel
)
checkdepends=(
  procps-ng
)
provides=(bats-core)
replaces=(bash-bats)
source=(${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('a1a9f7875aa4b6a9480ca384d5865f1ccf1b0b1faead6b47aa47d79709a5c5fd')
b2sums=('4d9e07f4b3da1cfadfd0ecbe00d611bc9a6ff8a6b55dba58e8ba4647e10265564d0cd64eb82a2b3ba483bc307b909f25913416057dc54ba8224c92cbff39c70e')

prepare() {
  cd "bats-core-${pkgver}"
  # move everything to /usr/lib instead of /usr/libexec
  sed 's|libexec|lib|g' -i \
    bin/* \
    libexec/bats-core/* \
    lib/bats-core/* \
    test/*.bats \
    *install.sh
  mv -v libexec/bats-core/* lib/bats-core/
}

check() {
  cd "bats-core-${pkgver}"
  TERM=linux bin/bats --jobs "$(nproc)" --tap test
}

package() {
  cd "bats-core-${pkgver}"

  install -Dm 755 bin/bats -t "${pkgdir}/usr/bin"
  install -Dm 644 lib/bats-core/*.bash -t "${pkgdir}/usr/lib/bats-core"
  install -Dm 755 lib/bats-core/bats* -t "${pkgdir}/usr/lib/bats-core"

  install -Dm 644 man/bats.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm 644 man/bats.7 -t "${pkgdir}/usr/share/man/man7"
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
