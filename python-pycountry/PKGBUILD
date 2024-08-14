# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contibutor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor:  Pawel "kTT" Salata <rockplayer.pl@gmail.com>

pkgname=python-pycountry
pkgver=24.6.1
pkgrel=1
pkgdesc="ISO country, subdivision, language, currency and script definitions and their translations"
arch=('any')
url="https://pypi.org/project/pycountry/"
license=('LGPL2.1')
depends=(python python-lxml)
makedepends=('python' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest' 'python-importlib-metadata' 'python-pytest-cov')
source=("https://pypi.io/packages/source/p/pycountry/pycountry-${pkgver}.tar.gz")
sha512sums=('36d8f68b830d74259a5f9ac1c9c97c1b228b0072613229e6f579ea5af587ab1cd25f0637a2cdd1dbf2ae8225e2aa2958d25f1e6df42d577da821d85c4c49ae93')

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
