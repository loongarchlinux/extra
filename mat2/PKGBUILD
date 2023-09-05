# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Francois Boulogne <devel at sciunto dot org>

pkgname=mat2
pkgver=0.13.4
pkgrel=1
pkgdesc='Metadata removal tool, supporting a wide range of commonly used file formats'
url='https://0xacab.org/jvoisin/mat2'
arch=('any')
license=('LGPL3')
depends=('python' 'python-mutagen' 'python-cairo' 'python-gobject' 'gdk-pixbuf2' 'poppler-glib' 'librsvg' 'perl-image-exiftool' 'mailcap')
makedepends=('python-setuptools')
optdepends=(
  'ffmpeg: video support'
  'bubblewrap: sandboxing support'
)
checkdepends=('ffmpeg')
source=(https://0xacab.org/jvoisin/mat2/-/archive/${pkgver}/mat2-${pkgver}.tar.gz
        https://0xacab.org/jvoisin/mat2/uploads/95d1f3782dfc731545fd9b467c594cb2/mat2-0.13.4.tar.gz.asc)
sha512sums=('75c08c9c52a82f9983e799c2aeef0da8324d1c92ac32fb748a68063ec7b28569692082aceacf7161d24db0e8a988357c423b6e17ca5c0f934309c9791c41ab18'
            'SKIP')
b2sums=('cab400479bbf312979e11f00bccf02e0e330455651dcdef239507c511b4101cb8b39af5f9dfdc1df9f1bcedc3dda3276c7cf598491c0ff0fc1f365f540fdb7a6'
        'SKIP')

validpgpkeys=('9FCDEE9E1A381F311EA62A7404D041E8171901CC') # Julien (jvoisin) Voisin

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

check() {
  cd ${pkgname}-${pkgver}
  python -m unittest discover -v
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --skip-build -O1 --root="${pkgdir}"
  install -Dm 644 dolphin/mat2.desktop -t "${pkgdir}/usr/share/kservices5/ServiceMenus"
  install -Dm 644 doc/mat2.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm 644 doc/*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
