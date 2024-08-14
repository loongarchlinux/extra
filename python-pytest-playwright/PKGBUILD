# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=playwright-pytest
pkgname=python-pytest-playwright
pkgver=0.5.1
pkgrel=1
pkgdesc='Pytest plugin to write end-to-end browser tests with Playwright'
arch=(any)
url='https://github.com/microsoft/playwright-pytest'
license=(Apache-2.0)
depends=(python
         python-pytest
         python-slugify)
makedepends=(git
             python-build
             python-installer
             python-setuptools-scm
             python-wheel)
source=(git+https://github.com/microsoft/$_name#tag=v$pkgver)
sha256sums=('8d1ca732a03851c0537f7ea8fbbc1b76f3b34b70b8a25739b87ab8f35863ea7a')

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  cd $_name
#  pytest -v
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
