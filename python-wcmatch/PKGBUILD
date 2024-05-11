# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=python-wcmatch
pkgver=8.5.1
pkgrel=2
pkgdesc='Wilcard File Name matching library'
arch=('any')
url='https://github.com/facelessuser/wcmatch'
license=('MIT')
depends=('python-bracex')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("https://github.com/facelessuser/wcmatch/archive/${pkgver}/wcmatch-${pkgver}.tar.gz")
b2sums=('db4d77651ab4fc6692c746d94dda68dc0fcdfe72a6e3b512b4f60a1bd5bf7015e21349d022c6ec17ea2bbc55ae87cf6c9a3690d9b6774f02a167b4b0ad65b691')

build() {
  cd wcmatch-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd wcmatch-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
