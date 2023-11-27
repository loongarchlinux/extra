# Maintainer: Angel Velasquez <angvp@archlinux.org> 
# Maintainer: AndyRTR <andyrtr@archlinux.org>

pkgbase=hunspell-es
pkgname=(hunspell-es_any hyphen-es mythes-es)
pkgver=2.8
pkgrel=2
epoch=1
arch=(any)
url='https://github.com/sbosio/rla-es'
license=(LGPL3)
makedepends=(qt6-webengine)
_countries=(
  'AR "Argentina"'
  'BO "Bolivia"'
  'CL "Chile"'
  'CO "Colombia"'
  'CR "Costa Rica"'
  'CU "Cuba"'
  'DO "Dominican Republic"'
  'EC "Ecuador"'
  'ES "Spain"'
  'GT "Guatemala"'
  'HN "Honduras"'
  'MX "Mexico"'
  'NI "Nicaragua"'
  'PA "Panama"'
  'PE "Peru"'
  'PR "Puerto Rico"'
  'PY "Paraguay"'
  'SV "El Salvador"'
  'UY "Uruguay"'
  'VE "Venezuela"'
)

source=(https://github.com/sbosio/rla-es/releases/download/v$pkgver/es.oxt)
noextract=(es.oxt)

for _co in "${_countries[@]}"; do
  _code=${_co%% *}
  noextract+=(es_$_code.oxt)
  source+=("https://github.com/sbosio/rla-es/releases/download/v$pkgver/es_$_code.oxt")
  _pkgname=hunspell-es_${_code,,}
  pkgname+=($_pkgname)
  eval "package_$_pkgname() {
    _package $_co
  }"
done

sha256sums=('8313cd843bbf235849278ad2ce04eb66a76b22332f68190a1ca7726d7a5c890d'
            '4114adf962633b57b01e6cf1a73e46bd0651dd4c737b75a968ab7cbf5eea8f46'
            'a6d73341951f2c60d9d631de5467a77bc3d3399514d615de7f44f67d69582971'
            '4abc591fa31f83a3405ff7d42ee6325bb0d306adf0c0f8e4f2f29b7aad0f2051'
            'bba2b1070f7eec88c160aade745729793eeeeee68529481d675654a389e8c0fa'
            'ca4ef428efde0618ffd63b8a836fe323756b5ab897b4a757b282b4bcaace9c7c'
            'b9b2e511072c395489fad98d79892c54f7b7fa3568411a98806d8873e8b6e973'
            '83ada8c5ad5e11ba1c826dd835414436ec880d43c60c8d042025142820357598'
            '04f7dcb09cac83d7938ff093a37df599800b0907ce096a9b88afe21046e6c589'
            '7b3984bf12217a9d5d4d33fc30e34a55517a4b9041d0fbde8433be49fa4f7a6c'
            '7be61504d92c6f2d03f2a1edcf1ebb145db6d8ca460d931f0fdb9adfb21c1c4e'
            'd3ff8aebee9cc7256d8b31a2e297a0a69b4ec61c1968f39f5b33c8c68d047b7d'
            '2d93e44e02179c308d10bbc0a1d8a1040352db3d7ffb48eadd09c1d985069703'
            'd5d8d9ef7238e5a9bc362078b6bf0ff6ada29a84b9acadc4c1d9b0ff48a4d83a'
            '1f3d0d0afaee6e6a1c540795679b7bc09d2582d238fb327a11b7ab83bd51882e'
            'd98ed4e94bea269c2ef114c756e5c900cbeccba8c1ec394ad70d58c700bcb791'
            'e8ef7aeeebb8ebc465f7a6c05b6a2cb641b22a2c7e34c7c20fd189e84d2249ff'
            '0b273f69f8aaba0bc73f0d8abdedb3d4aad71cb0f6799942161dc17b7e8ff655'
            '0b6913eb8a6b184eb55ea91eb683122ad7d26cc5ab9fb68f53f14d86a22700ef'
            'd16cc805c1fd0a93df360fd11e4e71c7f29c68282fd03b403670ee9f2bf7ff84'
            '9af61a09ce0d9bb81bc88fdfe9c3aab808134c2b3ba8dc21cde513be72569095')

_package() {
  pkgdesc="Spanish ($2) hunspell dictionary"
  depends=(hunspell)
  provides=('hunspell-dictionary')
  conflicts=(hunspell-es)

  LANG=en_US.utf8 bsdtar -xf es_$1.oxt

  install -dm755 "$pkgdir"/usr/share/hunspell
  install -Dm644 es_$1.dic es_$1.aff "$pkgdir/usr/share/hunspell"

  install -d "$pkgdir"/usr/share/myspell/dicts
  pushd "$pkgdir/usr/share/myspell/dicts"
    for _file in "$pkgdir"/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename $_file) .
    done
  popd

# Install webengine dictionaries   
  install -d "$pkgdir"/usr/share/qt{,6}/qtwebengine_dictionaries/
  for _file in "$pkgdir"/usr/share/hunspell/*.dic; do
  _filename=$(basename $_file)
    /usr/lib/qt6/qwebengine_convert_dict $_file "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/${_filename/\.dic/\.bdic}
  ln -rs "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/${_filename/\.dic/\.bdic} "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/
  done

  install -Dm644 README.txt -t "$pkgdir/usr/share/doc/$pkgname"
}

package_hunspell-es_any() {
  pkgdesc="Spanish (generic) hunspell dictionary"
  depends=(hunspell)
  provides=('hunspell-dictionary')
  conflicts=(hunspell-es)
  replaces=(hunspell-es)

  LANG=en_US.utf8 bsdtar -xf es.oxt

  install -Dm644 es.dic es.aff -t "$pkgdir"/usr/share/hunspell

  install -d "${pkgdir}/usr/share/myspell/dicts"
  pushd "$pkgdir/usr/share/myspell/dicts"
    for file in "$pkgdir"/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename $file) .
    done
  popd
  
# Install webengine dictionaries   
  install -d "$pkgdir"/usr/share/qt{,6}/qtwebengine_dictionaries/
  for _file in "$pkgdir"/usr/share/hunspell/*.dic; do
  _filename=$(basename $_file)
    /usr/lib/qt6/qwebengine_convert_dict $_file "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/${_filename/\.dic/\.bdic}
  ln -rs "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/${_filename/\.dic/\.bdic} "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/
  done

  install -Dm644 README.txt -t "$pkgdir/usr/share/doc/$pkgname"
}

package_hyphen-es() {
  pkgdesc="Spanish hyphenation rules"
  depends=(hyphen)

  install -Dm644 hyph_es.dic -t "$pkgdir"/usr/share/hyphen/

  pushd "$pkgdir"/usr/share/hyphen/
  for _co in "${_countries[@]}"; do
    ln -s hyph_es.dic hyph_es_${_co%% *}.dic
  done
  popd

  install -d "$pkgdir"/usr/share/myspell/dicts
  pushd "$pkgdir"/usr/share/myspell/dicts
    for file in "$pkgdir"/usr/share/hyphen/*; do
      ln -sv /usr/share/hyphen/$(basename $file) .
    done
  popd
  
  install -Dm644 README_hyph_es.txt -t "$pkgdir"/usr/share/doc/$pkgname/
}

package_mythes-es() {
  pkgdesc="Spanish thesaurus"
  depends=(libmythes)

  LANG=en_US.utf8 bsdtar -xf es.oxt
  install -Dm644 th_es_v2.* -t "$pkgdir"/usr/share/mythes

  pushd "$pkgdir"/usr/share/mythes/
  for _co in "${_countries[@]}"; do
    ln -s th_es_v2.idx "th_es_"${_co%% *}"_v2.idx" || true
    ln -s th_es_v2.dat "th_es_"${_co%% *}"_v2.dat" || true
  done
  popd

  install -d "$pkgdir"/usr/share/myspell/dicts
  pushd "$pkgdir"/usr/share/myspell/dicts
  for file in "$pkgdir"/usr/share/mythes/*; do
    ln -sv /usr/share/mythes/$(basename $file) .
  done
  popd
  
  install -Dm644 README_th_es.txt -t "$pkgdir"/usr/share/doc/$pkgname/
}
