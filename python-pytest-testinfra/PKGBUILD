# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: gardar <aur@gardar.net>
# Contributor: Morten Linderud <morten@linderud.pw>

_name=pytest-testinfra
pkgname=python-pytest-testinfra
pkgver=10.0.0
pkgrel=1
pkgdesc='Testinfra test your infrastructures'
arch=(any)
url="https://github.com/pytest-dev/pytest-testinfra"
license=(Apache)
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
checkdepends=(ansible
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
sha512sums=('8720420c4c19daf8584666289e3dda8fd9f1ff1c93eae59bf95d7c2959273d992968968b7c867b9c88e98fbcc394ee9dcca2b341bd82ffeaf98e8604144b11a3')
b2sums=('08e1c511acd2ad00c76d18eea05d240f45a393de16c80deaf49552920bace5dbc9210034224a48830132e46d1630cc73e6f33e069d1ece83c8104cf46ed8cfa6')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"

  cd $_name-$pkgver
  python -m build --wheel --no-isolation
  make -C doc man
}

check() {
  local pytest_options=(
    -vv
    --deselect test/test_backends.py::test_backend_importables  # we are currently missing python-looseversion in the repos
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
