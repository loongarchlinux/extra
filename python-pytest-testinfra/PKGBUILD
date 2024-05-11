# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: gardar <aur@gardar.net>
# Contributor: Morten Linderud <morten@linderud.pw>

_name=pytest-testinfra
pkgname=python-pytest-testinfra
pkgver=10.1.0
pkgrel=2
pkgdesc='Testinfra test your infrastructures'
arch=(any)
url="https://github.com/pytest-dev/pytest-testinfra"
license=(Apache-2.0)
depends=(
  python
  python-pytest
)
makedepends=(
  python-build
  python-installer
  python-setuptools-scm
  python-sphinx
  python-wheel
)
checkdepends=(
  ansible
  python-paramiko
  python-pytest-cov
  python-pytest-xdist
  python-pywinrm
  python-tornado
  salt
)
optdepends=(
  'ansible: for tests using ansible inventories'
  'docker: for test running docker containers'
  'kubectl: for test running containers in kubernetes'
  'lxd: for test running LXC or LXD containers'
  'podman: for test running podman containers'
  'python-paramiko: for testing remote hosts'
  'python-pywinrm: for testing on Windows hosts'
  'salt: for tests using saltstack'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('8d9d0b2031244842f31f349092f3e842608aa677a9ab8b94cea3f8ac1427c4422e96da56d6965e7edd27e72e4b6e5d80f84d239b09a2243b6f727b389321cb71')
b2sums=('6bc717749c6b50eca276103e590e2ab85cdcf94034a2a7075682939f140f7a024410449ecc7ce2a54cc33028c1359627923e0a0a11c7750693b00ae3a6e4ad37')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver make -C doc man
}

check() {
  local pytest_options=(
    -vv
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver

  # install to temporary location
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 doc/build/man/*.1 -t "$pkgdir/usr/share/man/man1/"
  install -vDm 644 {CHANGELOG,CONTRIBUTING,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
