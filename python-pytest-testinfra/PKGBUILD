# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: gardar <aur@gardar.net>
# Contributor: Morten Linderud <morten@linderud.pw>

_name=pytest-testinfra
pkgname=python-pytest-testinfra
pkgver=10.1.1
pkgrel=1
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
sha512sums=('f20c87c0842871edfe9711b4ffeeca9ca26481cd92d87f238c98c8b865b7a2662ebf2e2fae23affb82a5f130270ec4e68f6470ea993d50882ea171bf2acb2d8e')
b2sums=('e8e5b2bfe88438e3d56c41c122d6c3f97094bf719cb4951b888976383e0f03619bf46232679cc18002aa45346ec17e5c0ca3f5d749e242a05cee358c619fae38')

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
