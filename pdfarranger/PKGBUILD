# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Alois Nespor <alium at artixlinux.org>

pkgname=pdfarranger
pkgver=1.11.0
pkgrel=1
pkgdesc='Helps merge or split PDF documents and rotate, crop and rearrange pages'
arch=(any)
url='https://github.com/pdfarranger/pdfarranger'
license=(GPL-3.0-or-later)
depends=(ghostscript
         glib2
         gtk3
         pango
         poppler-glib
         python
         python-cairo
         python-dateutil
         python-gobject
         python-packaging
         python-pikepdf)
optdepends=('img2pdf: support for image files')
makedepends=(git
             python-build
             python-installer
             python-setuptools
             python-wheel)
source=(git+https://github.com/pdfarranger/pdfarranger#tag=$pkgver)
sha256sums=('58cc6b765c86f1f4cc677f992c18992991e129bfa8468b231ecb9c9bdb0d9526')

build () {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package () {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
