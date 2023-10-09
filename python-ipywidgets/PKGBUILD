# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-ipywidgets
_pipname=ipywidgets
pkgver=8.1.1
pkgrel=1
pkgdesc='IPython HTML widgets for Jupyter'
arch=(any)
url='https://github.com/ipython/ipywidgets'
license=(BSD)
depends=(ipython python-comm python-jsonschema)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('jupyterlab-widgets: widgets for Jupyter lab')
checkdepends=(python-pytest python-pytz python-ipykernel)
source=(https://pypi.io/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz)
sha256sums=('40211efb556adec6fa450ccc2a77d59ca44a060f4f9f136833df59c9f538e6e8')

build() {
  cd ipywidgets-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ipywidgets-$pkgver
  pytest -v
}

package() {
  cd ipywidgets-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
