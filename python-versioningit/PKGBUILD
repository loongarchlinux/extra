# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=python-versioningit
pkgver=2.2.1
pkgrel=1
pkgdesc='Versioning It with your Version In Git'
arch=('any')
url='https://github.com/jwodder/versioningit'
license=('MIT')
depends=('python-packaging' 'python-tomli')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('git' 'mercurial' 'python-pytest' 'python-tox')
source=("${pkgname#*n-}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname#*n-}-${pkgver}.tar.gz")
sha256sums=('0e58242d7abda61ae63596a5494ae9ed631ac85d8bb3cc8e176e3253ca4bcbb5')

build() {
  cd ${pkgname#*n-}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#*n-}-${pkgver}
  tox -e py311
}

package() {
  cd ${pkgname#*n-}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
