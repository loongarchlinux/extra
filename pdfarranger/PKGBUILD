# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Alois Nespor <alium at artixlinux.org>

pkgname=pdfarranger
pkgver=1.10.1
pkgrel=2
pkgdesc='Helps merge or split PDF documents and rotate, crop and rearrange pages'
arch=(any)
url='https://github.com/pdfarranger/pdfarranger'
license=(GPL3)
depends=(ghostscript
         gtk3
         poppler-glib
         python
         python-cairo
         python-dateutil
         python-gobject
         python-pikepdf)
optdepends=('img2pdf: support for image files')
makedepends=(python-build
             python-installer
             python-setuptools
             python-wheel)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('1d9648f81b9f0937ca723f7502a1dadcc4f3f6050afc6f0d4653bfaa8728a805')

build () {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package () {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
