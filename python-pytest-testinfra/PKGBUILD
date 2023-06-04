# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: gardar <aur@gardar.net>
# Contributor: Morten Linderud <morten@linderud.pw>

_name=pytest-testinfra
pkgname=python-pytest-testinfra
pkgver=8.1.0
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
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('2f98cc15952c5607ecc1db76bae90aa9d299951cd1f4c5f8ba6085a7f4e6babac7f4ef4e44e089829f7382139164259007125f505c18129cc7135b840d709931')
b2sums=('169ccd6afc4260f3dd42c8eff8112395adc7216cfd3e5f7abeb9b9d3db0cd766465dd94a5ca500d610db469f0e51298b6fc26f3c0ffd27f2fc215d859c99e52d')

build() {
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
