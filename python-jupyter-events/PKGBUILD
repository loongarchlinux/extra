# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pipname=jupyter_events
pkgname=python-jupyter-events
pkgver=0.7.0
pkgrel=1
pkgdesc='Configurable event system for Jupyter applications and extensions'
arch=(any)
url='https://jupyter.org/'
license=(BSD)
depends=(python-jsonschema python-json-logger python-traitlets python-yaml python-click python-rich)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest-console-scripts python-pytest-asyncio python-rfc3986-validator python-rfc3339-validator)
source=(https://github.com/jupyter/jupyter_events/releases/download/v$pkgver/$_pipname-$pkgver.tar.gz)
sha256sums=('7be27f54b8388c03eefea123a4f79247c5b9381c49fb1cd48615ee191eb12615')

build() {
  cd $_pipname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pipname-$pkgver
  python -m venv --system-site-packages test-env
  export PATH="$PWD/test-env/bin:$PATH"
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
  rm -r test-env
}

package() {
  cd $_pipname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
#  rm -r "$pkgdir"/build
}
