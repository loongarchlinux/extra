# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Gilbert Kennen <gilbert firewatcher org>

pkgname=elixir
pkgver=1.15.6
pkgrel=1

pkgdesc="a functional meta-programming aware language built on top of the Erlang VM"
url="https://elixir-lang.org"
license=('Apache' 'custom:EPL')

arch=('any')

depends=('erlang-nox')
checkdepends=('git')

source=("$pkgname-$pkgver.tar.gz::https://github.com/elixir-lang/elixir/archive/v$pkgver.tar.gz"
	"address_tests_on_Erlang_26.1.patch::https://github.com/elixir-lang/elixir/commit/60efbf751d3bedbe1851ac8c701a807d66fe340d.patch")
sha256sums=('385fc1958bcf9023a748acf8c42179a0c6123c89744396840bdcd661ee130177'
            '84a92ae228ea90c441821d896a02b392fa7e58715b9084a19a36b53f4bc3a615')

prepare() {
  cd elixir-"$pkgver"
  # Temporary patch to fix tests
  # https://github.com/elixir-lang/elixir/issues/12975
  patch -Np1 < "${srcdir}/address_tests_on_Erlang_26.1.patch"
}

build() {
  cd elixir-"$pkgver"
  make
}

check() {
  cd elixir-"$pkgver"
  ERL_EPMD_PORT=5369 make test

  # The elixir test suite starts up epmd and then doesn't kill it again afterwards.
  epmd -port 5369 -kill
}

package() {
  cd elixir-"$pkgver"
  mkdir -p "$pkgdir"/usr/share/licenses/"$pkgname"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
