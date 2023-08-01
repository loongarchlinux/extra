# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-ipywidgets
_pipname=ipywidgets
pkgver=8.0.7
pkgrel=2
pkgdesc='IPython HTML widgets for Jupyter'
arch=(any)
url='https://github.com/ipython/ipywidgets'
license=(BSD)
depends=(python-ipykernel python-jsonschema)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('jupyterlab-widgets: widgets for Jupyter lab')
checkdepends=(python-pytest python-pytz)
source=(https://pypi.io/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz)
sha256sums=('50ace0a8886e9a0d68b980db82f94c25d55d21ff2340ed36f802dd9365e94acf')

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
