# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=copr-cli
pkgver=1.105
pkgrel=2
pkgdesc="CLI tool to run copr"
url="https://github.com/fedora-copr/copr"
license=('GPL-2.0-or-later')
arch=('any')
depends=('python-copr' 'python-humanize' 'python-simplejson' 'python-jinja' 'python-setuptools'
         'python-future')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-responses')
source=("https://github.com/fedora-copr/copr/archive/copr-cli-$pkgver-1.tar.gz")
sha512sums=('76ce84a9300ac9f68732a0c8d4421d1e6007a4d92dacac4182b5687aa3f5c256a06dcc877a86d087ca737db29e53cafce470f62c8974b481f4e42cb30cb4e8ad')

build() {
  cd copr-copr-cli-$pkgver-1/cli
  python -m build --wheel --no-isolation
}

check() {
  cd copr-copr-cli-$pkgver-1/cli
  python -m pytest
}

package() {
  cd copr-copr-cli-$pkgver-1/cli
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 man/*.1 -t "$pkgdir"/usr/share/man/man1/
}
