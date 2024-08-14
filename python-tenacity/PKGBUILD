# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tenacity
pkgver=8.5.0
pkgrel=1
pkgdesc='Retry code until it succeeeds'
arch=('any')
license=('Apache-2.0')
url='https://github.com/jd/tenacity'
depends=('python')
optdepends=('python-tornado: for Tornado coroutines support')
makedepends=('git' 'python-setuptools-scm' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer')
checkdepends=('python-pytest' 'python-tornado' 'python-trio' 'python-typeguard')
source=("git+https://github.com/jd/tenacity.git#tag=$pkgver")
sha512sums=('a3daaaa70ac806aa2d636ecbe51f0a4099c8b0569180fee0fa92e21b90078542b7aa5362096517cad8113f1a0efc3c745d8c39e80f6a583024511925180c9f9b')

build() {
  cd tenacity
  python -m build --wheel --no-isolation
}

check() {
  cd tenacity
  pytest
}

package() {
  cd tenacity
  python -m installer --destdir="$pkgdir" dist/*.whl
}
