# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Asger Hautop Drewsen <asgerdrewsen@gmail.com>

pkgname=(
  'ttf-nerd-fonts-symbols'
  'ttf-nerd-fonts-symbols-mono'
  'ttf-nerd-fonts-symbols-common'
)
pkgbase=ttf-nerd-fonts-symbols
pkgver=3.1.1
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
b2sums=('2c22b0375e9646082f5234f42c37ffcc3aca41c03afc962ca09226e72de3a83c88536c23d6a7cad14b144fe0f3434f210d51ad5124351cffc0c649a8b3774d02'
        'deae35a7f1f4d9bc692defcac30cc6ef0cece58671ef68384f89d14710a8c5ca751b3f89109a7ff0a7227ebfd8948d7efeec193fb6b7b779545e91857c2d1a7d'
        '5246807cdd9e81eec3102e48ff42dad76a32e8c7d24823b7757fcec8844dd6568602025876b7cc9717c5f4a6afefc0aa35241c5ec6d75d6649c653b2a8bd5a6e'
        'cf89e6d30dfd223c0b67941c1641d3290f0ff9bdb49b618a5938079c885ff74e61c555119fc5e0d9111bd37dbb21401f9cd6dc8a29bf3d6f97fc3a4827b6c1e3')

_package() {
  groups=('nerd-fonts')
  depends=('ttf-nerd-fonts-symbols-common')
  provides=('ttf-font-nerd')

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
