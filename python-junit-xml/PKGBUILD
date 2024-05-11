# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-junit-xml
# The commit that bumps version in setup.py
_commit=19d3cc333d35dfd2d17d75c506336c15e5c6685a
pkgver=1.9
pkgrel=8
pkgdesc='A Python module for creating JUnit XML test result documents'
arch=(any)
url='https://github.com/kyrus/python-junit-xml'
license=(MIT)
depends=(python python-six)
makedepends=(python-build python-installer python-setuptools python-wheel git)
checkdepends=(python-pytest)
# There are neither tags nor PyPI source tarball...
# https://github.com/kyrus/python-junit-xml/issues/68
source=("git+https://github.com/kyrus/python-junit-xml?signed#commit=$_commit")
sha256sums=('SKIP')
validpgpkeys=(
  '8CCF41209F4D9FB6599E8943B797246363239E88'  # Brian Beyer <brian@redcanary.com>
)

build() {
  cd python-junit-xml
  python -m build --wheel --no-isolation
}

check() {
  cd python-junit-xml
  pytest -v tests
}

package() {
  cd python-junit-xml
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
