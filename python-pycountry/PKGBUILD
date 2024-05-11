# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contibutor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor:  Pawel "kTT" Salata <rockplayer.pl@gmail.com>

pkgname=python-pycountry
pkgver=23.12.11
pkgrel=2
pkgdesc="ISO country, subdivision, language, currency and script definitions and their translations"
arch=('any')
url="https://pypi.org/project/pycountry/"
license=('LGPL2.1')
depends=(python python-lxml)
makedepends=('python' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest' 'python-importlib-metadata')
source=("https://pypi.io/packages/source/p/pycountry/pycountry-${pkgver}.tar.gz")
sha512sums=('25b5a74c0dd8115473571976a64b6fed7010f62c1b3b4c1888b9e13a7cf4f533173f51d4652d55c426adee4e0ff119bb6e3132d04dce150b9d1ca4b11366c579')

build(){
  cd "pycountry-${pkgver}"
  python -m build --wheel --no-isolation
}

check(){
  cd "pycountry-${pkgver}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
#  PYTHONPATH="$PWD/src" pytest -v
}

package() {
  cd "pycountry-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
