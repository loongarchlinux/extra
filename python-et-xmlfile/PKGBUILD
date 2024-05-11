# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname='python-et-xmlfile'
pkgver=1.1
pkgrel=5
pkgdesc="A low memory library for creating large XML files."
arch=('any')
url="https://et-xmlfile.readthedocs.io/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-lxml')
source=("https://foss.heptapod.net/openpyxl/et_xmlfile/-/archive/${pkgver}/et_xmlfile-${pkgver}.tar.gz")
sha256sums=('707c2211ba4a041fd866ef6a60966f4ff82c89f4d4dfabf5aea59aaf97f9be4f')

prepare() {
  cd "$srcdir"/et_xmlfile-${pkgver}
  # fix deprecation warning
  sed -i "s/strict$/strict-markers/" pytest.ini
}

build() {
  cd "$srcdir"/et_xmlfile-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir"/et_xmlfile-${pkgver}
  PYTHONPATH="$PWD/et_xmlfile" pytest
}

package() {
  cd "$srcdir"/et_xmlfile-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENCE.rst "$pkgdir"/usr/share/licenses/$pkgname/LICENCE
}
