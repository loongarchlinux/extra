# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-ipywidgets
_pipname=ipywidgets
pkgver=8.1.2
pkgrel=3
pkgdesc='IPython HTML widgets for Jupyter'
arch=(any)
url='https://github.com/ipython/ipywidgets'
license=(BSD-3-Clause)
depends=(ipython
         python
         python-comm
         python-ipykernel
         python-jsonschema
         python-traitlets)
makedepends=(git
             python-build
             python-installer
             python-setuptools
             python-wheel)
optdepends=('jupyterlab-widgets: widgets for Jupyter lab')
checkdepends=(python-ipykernel
              python-pytest
              python-pytz)
source=(git+https://github.com/jupyter-widgets/ipywidgets#tag=$pkgver
        https://github.com/jupyter-widgets/ipywidgets/commit/bbc6c064.patch)
sha256sums=('146cac83855ac40dd7264a654ebd8efbe81fff089405865f5456fd21afe5e1e6'
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
