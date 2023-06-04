# Maintainer: David Runge <dvzrv@archlinux.org>

pkgbase=vst3sdk
pkgname=(vst3sdk vst3sdk-docs)
pkgver=3.7.8_build_34
_commit=0041ef2c879c3c54c03d33cdc11a97eaebfb5752  # 3.7.8_build_34
pkgrel=1
pkgdesc="VST 3 Plug-In SDK"
arch=(any)
url="https://github.com/steinbergmedia/vst3sdk"
license=(GPL3)
makedepends=(git rsync)
# upstream does not provide proper tarballs:
# https://github.com/steinbergmedia/vst3sdk/issues/65
source=(
  git+https://github.com/steinbergmedia/$pkgname#commit=$_commit
  git+https://github.com/steinbergmedia/vst3_base
  git+https://github.com/steinbergmedia/vst3_cmake
  git+https://github.com/steinbergmedia/vst3_doc
  git+https://github.com/steinbergmedia/vst3_pluginterfaces
  git+https://github.com/steinbergmedia/vst3_public_sdk
  git+https://github.com/steinbergmedia/vstgui
  $pkgname.pc
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '501dff8299ccf9aeba61a64331c3ac74ece89eee956bffff0e303653b566acfca5cba4957c8bafb883efe6cc78c34da64ec9870daf9f2c37e2734110b9cad1dd')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'e39e1353fdc22f7d93b6f89f8242fafddd56422a03df1cb26e81a3874456c49029a3726b43223fe21231eff6fe240e1216f3dca36a0e5297c9c0d43ab390bcd9')

prepare() {
  # upstream does not provide a pkg-config integration:
  # https://github.com/steinbergmedia/vst3sdk/issues/68
  sed -e "s/VERSION/$pkgver/" -i $pkgname.pc

  cd $pkgname
  git submodule init
  git config submodule.base.url ../vst3_base
  git config submodule.cmake.url ../vst3_cmake
  git config submodule.doc.url ../vst3_doc
  git config submodule.pluginterfaces.url ../vst3_pluginterfaces
  git config submodule.public.sdk.url ../vst3_public_sdk
  git config submodule.vstgui4.url ../vstgui
  git -c protocol.file.allow=always submodule update
}

package_vst3sdk() {
  license+=(BSD)

  cd $pkgbase
  install -vDm 644 ../$pkgname.pc -t "$pkgdir/usr/lib/pkgconfig/"
  install -vdm 755 "$pkgdir/usr/src/$pkgname/"
  rsync -r --exclude doc --exclude .git --exclude .github --exclude .gitignore --exclude .gitattributes . "$pkgdir/usr/src/$pkgname/"
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 base/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.base.txt"
  install -vDm 644 public.sdk/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.public.sdk.txt"
  install -vDm 644 cmake/modules/*.cmake -t "$pkgdir/usr/lib/cmake/$pkgname/"
}

package_vst3sdk-docs() {
  pkgdesc+=" - documentation"

  install -vdm 755 "$pkgdir/usr/share/doc/$pkgname/"
  cd $pkgbase/doc
  rsync -r --exclude .git --exclude .github --exclude .gitignore --exclude .gitattributes . "$pkgdir/usr/share/doc/$pkgname/"
}
