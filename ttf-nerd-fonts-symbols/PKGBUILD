# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Asger Hautop Drewsen <asgerdrewsen@gmail.com>

pkgname=(
  'ttf-nerd-fonts-symbols'
  'ttf-nerd-fonts-symbols-mono'
  'ttf-nerd-fonts-symbols-common'
)
pkgbase=ttf-nerd-fonts-symbols
pkgver=3.0.2
pkgrel=1
pkgdesc="High number of extra glyphs from popular 'iconic fonts'"
arch=('any')
url=https://github.com/ryanoasis/nerd-fonts
license=('MIT')
install=$pkgbase.install
source=(
  "SymbolsNerdFont-Regular-$pkgver.ttf::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/patched-fonts/NerdFontsSymbolsOnly/SymbolsNerdFont-Regular.ttf"
  "SymbolsNerdFontMono-Regular-$pkgver.ttf::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/patched-fonts/NerdFontsSymbolsOnly/SymbolsNerdFontMono-Regular.ttf"
  "10-nerd-font-symbols-$pkgver.conf::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/10-nerd-font-symbols.conf"
  "Nerd_Fonts-$pkgver-LICENSE::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/LICENSE"
)
b2sums=('d6b24c31d525f869f98833a4388b1d0d37fed5c4a5a3c82fa79e6e1910180659502b4b16894c8bdbd24d77df1ed2d4f18b43bfdb7ddacef48257d9957560a5a5'
        'c30301feedb5a65079b36e0c55a83aaedb5b4cb63475b55a51e0305b2354e923d75756d93a31cae232ae7d0dfb58a2f1db4f98fa47874e21404baca8d0e351f9'
        'e5673efc640f864d23a226c538ba3e541eb655fdcdcd056103d9d3646ba4eb811aac6227d934612de9bdf8cbf2290914d046bd7e6e7e38ea6a1935bcdbc2ff50'
        'cf89e6d30dfd223c0b67941c1641d3290f0ff9bdb49b618a5938079c885ff74e61c555119fc5e0d9111bd37dbb21401f9cd6dc8a29bf3d6f97fc3a4827b6c1e3')

_package() {
  groups=('nerd-fonts')
  depends=('ttf-nerd-fonts-symbols-common')
  provides=('nerd-fonts' 'ttf-font-nerd')

  install -d "$pkgdir"/usr/share/licenses/"$1"
  ln -s /usr/share/licenses/ttf-nerd-fonts-symbols-common/LICENSE \
    "$pkgdir"/usr/share/licenses/"$1"/LICENSE

  case "$1" in
    ttf-nerd-fonts-symbols)
      conflicts=(ttf-nerd-fonts-symbols-{1000,2048}-em)
      replaces=(ttf-nerd-fonts-symbols-{1000,2048}-em)

      install -Dm644 SymbolsNerdFont-Regular-$pkgver.ttf \
        "$pkgdir/usr/share/fonts/TTF/SymbolsNerdFont-Regular.ttf"
      ;;
    ttf-nerd-fonts-symbols-mono)
      pkgdesc+=' (monospace)'
      conflicts=(ttf-nerd-fonts-symbols-{1000,2048}-em-mono)
      replaces=(ttf-nerd-fonts-symbols-{1000,2048}-em-mono)

      install -Dm644 SymbolsNerdFontMono-Regular-$pkgver.ttf \
        "$pkgdir/usr/share/fonts/TTF/SymbolsNerdFontMono-Regular.ttf"
      ;;
  esac
}

package_ttf-nerd-fonts-symbols-common() {
  pkgdesc+=' (common files)'
  install -Dm644 10-nerd-font-symbols-$pkgver.conf \
    "$pkgdir"/usr/share/fontconfig/conf.avail/10-nerd-font-symbols.conf
  install -Dm644 Nerd_Fonts-$pkgver-LICENSE \
    "$pkgdir"/usr/share/licenses/ttf-nerd-fonts-symbols-common/LICENSE
}

for _pkgname in "${pkgname[@]/*-common}"; do
  eval "package_$_pkgname() { _package $_pkgname; }"
done
