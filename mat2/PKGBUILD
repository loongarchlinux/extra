# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Francois Boulogne <devel at sciunto dot org>

pkgname=mat2
pkgver=0.13.4
pkgrel=5
pkgdesc='Metadata removal tool, supporting a wide range of commonly used file formats'
url='https://0xacab.org/jvoisin/mat2'
arch=('any')
license=('LGPL3')
depends=(
  'gdk-pixbuf2'
  'hicolor-icon-theme'
  'librsvg'
  'mailcap'
  'perl-image-exiftool'
  'poppler-glib'
  'python'
  'python-cairo'
  'python-gobject'
  'python-mutagen'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'ffmpeg: video support'
  'bubblewrap: sandboxing support'
  'kdialog: dolphin file browser integration'
)
checkdepends=('ffmpeg')
source=(https://0xacab.org/jvoisin/mat2/-/archive/${pkgver}/mat2-${pkgver}.tar.gz
        https://0xacab.org/jvoisin/mat2/uploads/95d1f3782dfc731545fd9b467c594cb2/mat2-0.13.4.tar.gz.asc
        tests-VideoFullRangeFlag.patch::https://0xacab.org/jvoisin/mat2/-/commit/bbd5b2817c9d64013e2f5ed670aca8d4738bb484.patch
        manpage-location.patch::https://0xacab.org/jvoisin/mat2/-/commit/a3081bce47bc475a7afaa25e834e8afe399dc350.patch)
sha512sums=('75c08c9c52a82f9983e799c2aeef0da8324d1c92ac32fb748a68063ec7b28569692082aceacf7161d24db0e8a988357c423b6e17ca5c0f934309c9791c41ab18'
            'SKIP'
            'f0b0a61e38825e64aaea268d440727140e782b9ebf32b0618185750eb8309fe0b09d24a0798c61a7053edf101c07d5838f88c46aea1b2da272584ec0a22f5407'
            '64e8bf0faeb7bf205d74607bab452474b2b496f8e1335dce1423e4d558827279ce6946d2c50d910b9dbbbb81e9c93baf90ae53c31024fd1fdbe2e0b9d88b6f86')
b2sums=('cab400479bbf312979e11f00bccf02e0e330455651dcdef239507c511b4101cb8b39af5f9dfdc1df9f1bcedc3dda3276c7cf598491c0ff0fc1f365f540fdb7a6'
        'SKIP'
        'b4812de051961aec68ce95f5fe1237d52e55320e30fe94ebe4c5652f2dd6b7ae0277e6d213c1dd8265699cbad7f77dff5fff1e14dfb9d3f6c1de3bea75695e11'
        'dee99f816e44b0b1276b589488eff9f3e1adc02f607c3eab81a06736eb3d8fe77108e80c71c3d2f445c4abe0367950c1371a93d7c2867f6ddbcb17f5388b3618')

validpgpkeys=('9FCDEE9E1A381F311EA62A7404D041E8171901CC') # Julien (jvoisin) Voisin

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ../tests-VideoFullRangeFlag.patch
  patch -Np1 -i ../manpage-location.patch
}

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  python -m unittest discover -v
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 dolphin/mat2.desktop -t "${pkgdir}/usr/share/kio/servicemenus"
  install -Dm 644 data/mat2.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -Dm 644 doc/*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
