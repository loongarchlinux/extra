# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-ignore-flaky
pkgver=2.2.1
pkgrel=1
pkgdesc="Ignore failures from flaky tests (pytest plugin)"
arch=('any')
license=('MIT')
url="https://github.com/coherent-oss/pytest-ignore-flaky/"
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm'
             'python-wheel')
source=("git+https://github.com/coherent-oss/pytest-ignore-flaky.git#tag=v$pkgver")
sha512sums=('55d8e0d6b1b93687608a6cb97bc2d3de77876d1408eb3240c3e1f78be022706e7a3736e45f65e5b33c7f93470c726d2c32bc2e97f6f746a2153c04e05d2d5dd5')

build() {
  cd pytest-ignore-flaky
  python -m build -nw
}

check() {
  cd pytest-ignore-flaky
  python -m venv --system-site-packages venv
  venv/bin/python -m installer dist/*.whl
  venv/bin/python -m pytest
}

package() {
  cd pytest-ignore-flaky
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
