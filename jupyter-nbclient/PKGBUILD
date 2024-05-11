# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=jupyter-nbclient
pkgver=0.10.0
pkgrel=3
pkgdesc='A tool for running Jupyter Notebooks in different execution contexts'
arch=(any)
url='https://github.com/jupyter/nbclient'
license=(BSD-3-Clause)
depends=(jupyter-nbformat
         python
         python-jupyter-client
         python-jupyter-core
         python-traitlets)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(jupyter-nbconvert
              python-flaky
              python-ipywidgets
              python-pytest-asyncio
              python-testpath
              python-xmltodict)
source=(https://github.com/jupyter/nbclient/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('d2c3e5ed5a1687117025756ddd20859c12019325fabe83c1f3b3c8045b9cc14f')

build() {
  cd nbclient-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd nbclient-$pkgver
  pytest -v -k 'not test_cli_simple' # fails on build server
}

package() {
  cd nbclient-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
