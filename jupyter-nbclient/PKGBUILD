# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=jupyter-nbclient
pkgver=0.9.0
pkgrel=1
pkgdesc='A tool for running Jupyter Notebooks in different execution contexts'
arch=(any)
url='https://github.com/jupyter/nbclient'
license=(BSD)
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
              python-xmltodict)
source=(https://github.com/jupyter/nbclient/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('05f3769d496d67d70f937a4a158aa0cb50fddb3576542b9e8f2a3865832b871c')

build() {
  cd nbclient-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd nbclient-$pkgver
  pytest -v
}

package() {
  cd nbclient-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
