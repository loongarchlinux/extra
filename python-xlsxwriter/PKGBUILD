# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-xlsxwriter
pkgver=3.1.9
pkgrel=2
pkgdesc='A Python module for creating Excel XLSX files'
arch=('any')
url='https://github.com/jmcnamara/XlsxWriter'
license=('BSD')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
_commit='9c5fb674d0d6ed4a9047aa774e4dc94ebc68a2b0'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^RELEASE_//'
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m unittest discover
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/XlsxWriter-$pkgver.dist-info/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
