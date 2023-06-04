# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=jupyter-nbclient
pkgver=0.8.0
pkgrel=1
pkgdesc='A tool for running Jupyter Notebooks in different execution contexts'
arch=(any)
url='https://github.com/jupyter/nbclient'
license=(BSD)
depends=(python-traitlets python-jupyter-client jupyter-nbformat python-testpath)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest-asyncio python-xmltodict jupyter-nbconvert python-ipywidgets python-flaky)
source=(https://github.com/jupyter/nbclient/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('b61e04d8aa226804fc9e2c24d84958c4a2ae0946c43350db149c126e9c7c8e54')

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
