# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Alois Nespor <alium at artixlinux.org>

pkgname=pdfarranger
pkgver=1.10.0
pkgrel=1
pkgdesc='Helps merge or split PDF documents and rotate, crop and rearrange pages'
arch=(any)
url='https://github.com/pdfarranger/pdfarranger'
license=(GPL3)
depends=(gtk3 python-gobject python-cairo python-pikepdf python-dateutil ghostscript poppler-glib)
optdepends=('img2pdf: support for image files')
makedepends=(python-build python-installer python-setuptools python-wheel)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('c8b136517f0277ee5c85c54d220c069f102a29dd3b16fd006c38fe800226089e')

build () {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package () {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
