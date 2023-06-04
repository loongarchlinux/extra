# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Vianney le Clément <vleclement AT gmail·com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=parallel
pkgname=('parallel' 'parallel-docs')
pkgver=20230522
pkgrel=1
pkgdesc='A shell tool for executing jobs in parallel'
arch=('any')
url='https://www.gnu.org/software/parallel/'
license=('GPL3')
source=(
  "https://ftp.gnu.org/gnu/$pkgbase/$pkgbase-$pkgver.tar.bz2"{,.sig}
  '0001-Remove-citation-things.patch'
)
sha512sums=('09099ffc9c82e19ededff917142d9d8be671ec5a85b18a263de2fcf791acee36d5c12273e812b125300e2f542009acbf3f03410c3c4d3de05c527241c01bcf0d'
            'SKIP'
            '3f84d5001f67c36be5faf963519bcb70dfc9df1f54a084604736011cd5402eb016897643ff516734829fe6265ff0f8d0d00c2081c25e20dd4f16e87ef953cb30')
b2sums=('7a571ff433e56e68956e1c6895cafe62ff87ca832f1cc57032a024a4f946a875f125c78ffdf6dbf75c397f6990e62e80fe2d840fa21b1db851bc6832de75c104'
        'SKIP'
        'c1c450edaae64c70b786de024dd917733ff9bc270794e886d4aef419f9b6445ca6c1327de841fe78a92cebe6fdf671f9fb471a7282c23fc221aa79f7bf3f2e61')
validpgpkeys=('CDA01A4208C4F74506107E7BD1AB451688888888')

prepare() {
  cd "$pkgbase-$pkgver"

  # remove citation warnings
  patch -p1 -i "$srcdir/0001-Remove-citation-things.patch"

  # remove gnu branding
  sed \
    --in-place \
    --regexp-extended \
    --expression 's/GNU\s{1,3}Parallel/Parallel/g' \
    --expression 's/run_gnu_parallel/run_parallel/g' \
    --expression 's/with_GNU_Parallel/with_Parallel/g' \
    --expression 's/GNU \$Global::progname/\$Global::progname/g' \
    --expression 's/@GNU_Parallel/@Parallel/g' \
    src/parallel
}

build() {
  cd "$pkgbase-$pkgver"

  ./configure --prefix=/usr

  make
}

package_parallel() {
  depends=('perl' 'procps')
  optdepends=('parallel-docs: documentation')

  cd "$pkgbase-$pkgver"

  make DESTDIR="$pkgdir" install

  # split documentation out of main package
  mv "$pkgdir/usr/share/doc" docs
}

package_parallel-docs() {
  pkgdesc+=' (documentation)'

  cd "$pkgbase-$pkgver"

  install -vd "$pkgdir/usr/share/doc"
  mv -v docs/* "$pkgdir/usr/share/doc"
}

# vim:set ts=2 sw=2 et:
