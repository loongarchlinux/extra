# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: gardar <aur@gardar.net>
# Contributor: Morten Linderud <morten@linderud.pw>

_name=pytest-testinfra
pkgname=python-pytest-testinfra
pkgver=9.0.0
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
sha512sums=('92faa7d8bac702876514e7d0566db8d04ed69325dd74b0a0a8b66c0a514450a8815b8ac3b8f67ed7c17bd39349a2363f73627cb88700a194be496cfcf7f15973')
b2sums=('2e506a9a41dc403f9b9a9c667ced5c905a47da63f9155da436f210871aefb85a477dd35fd1931c123cfa4f9c7e608aef8daecb0a4051ef31eb8ea83950177c7b')

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
