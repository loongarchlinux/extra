# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: crab2313 <crab2313@gmail.com>

pkgname=python-gitlab
pkgver=3.15.0
pkgrel=1
pkgdesc="Python wrapper for the GitLab API"
arch=('any')
url="https://github.com/python-gitlab/python-gitlab"
license=('LGPL3')
depends=('python' 'python-requests' 'python-requests-toolbelt')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pyyaml' 'python-responses')
optdepends=(
  'python-argcomplete: for autocompletion'
  'python-pyyaml: for YAML support'
)
source=($pkgname-$pkgver.tar.gz::https://github.com/python-gitlab/python-gitlab/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('08fc52a8209a2aa6dc258a6bc73a4afecd5d0fc3faae79c9a3d202afcc72508f26f2125e88a1d3e2649857ac47409ad56c10fbfc17b9f7459b939d5385c8306f')
b2sums=('56069ca1a0291b69d166664b5057df52ad279844b45017282deb3298f4d693f034f4ea5074eaeb8d12038cd9fe14809c40fd572184ffd3417198cf66e445aedd')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  pytest -v --ignore tests/functional/
}

package() {
  python -m installer --destdir="$pkgdir" $pkgname-$pkgver/dist/*.whl
}
