# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=jupyter-notebook
_pipname=notebook
pkgver=7.0.4
pkgrel=1
pkgdesc='The language-agnostic HTML notebook application for Project Jupyter'
arch=(any)
url='https://github.com/jupyter/notebook'
license=(BSD)
depends=(jupyterlab python-tornado python-traitlets python-jupyter-core python-jupyter-client)
makedepends=(python-build python-installer python-hatch-jupyter-builder)
checkdepends=(python-pytest-jupyter python-pytest-timeout python-requests)
replaces=(jupyter-retrolab)
source=(https://pypi.io/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz)
sha256sums=('0c1b458f72ce8774445c8ef9ed2492bd0b9ce9605ac996e2b066114f69795e71')

build() {
  cd notebook-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd notebook-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v -W ignore::DeprecationWarning
}

package() {
  cd notebook-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  mv "$pkgdir"/{usr/,}etc

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 jupyter-notebook.desktop -t "$pkgdir"/usr/share/applications
}
