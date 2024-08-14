# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-ipywidgets
_pipname=ipywidgets
pkgver=8.1.3
pkgrel=2
pkgdesc='IPython HTML widgets for Jupyter'
arch=(any)
url='https://github.com/ipython/ipywidgets'
license=(BSD-3-Clause)
depends=(ipython
         python
         python-comm
         python-ipykernel
         python-traitlets)
makedepends=(git
             python-build
             python-installer
             python-setuptools
             python-wheel)
optdepends=('jupyterlab-widgets: widgets for Jupyter lab')
checkdepends=(python-ipykernel
              python-jsonschema
              python-pytest
              python-pytz)
source=(git+https://github.com/jupyter-widgets/ipywidgets#tag=$pkgver
        https://github.com/jupyter-widgets/ipywidgets/commit/bbc6c064.patch)
sha256sums=('79fb72d85f7cd22f6bc8bde97d9e078ccc395637f2844502a55477d53abf094f'
            'df055ab534084dbcb88cfbf21a87e30bd63f0b22201fdbd531fd8c4177af45e2')

prepare() {
  cd ipywidgets
  patch -p1 -i "$srcdir"/bbc6c064.patch # Fix tests with pytest 8
}

build() {
  cd ipywidgets/python/ipywidgets
  python -m build --wheel --no-isolation
}

check() {
  cd ipywidgets/python/ipywidgets
  pytest -v
}

package() {
  cd ipywidgets/python/ipywidgets
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
