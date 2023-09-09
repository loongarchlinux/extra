# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=molecule
pkgver=6.0.2
pkgrel=1
pkgdesc="Aids in the development and testing of Ansible roles"
arch=(any)
url="https://github.com/ansible-community/molecule"
license=(MIT)
depends=(
  python
  python-ansible-compat
  python-click
  python-click-help-colors
  python-cookiecutter
  python-enrich
  python-jinja
  python-jsonschema
  python-packaging
  python-pluggy
  python-pyyaml
  python-rich
  python-wcmatch
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  ansible
  check-jsonschema
  python-ansi2html
  python-filelock
  python-pexpect
  python-pytest
  python-pytest-mock
  python-pytest-testinfra
  python-pytest-xdist
  yamllint
)
optdepends=(
  'ansible: for the ansible verifier'
  'molecule-docker: for the docker driver'
  'molecule-podman: for the podman driver'
  'molecule-vagrant: for the vagrant driver'
  'python-pywinrm: for Windows support'
  'python-pytest-testinfra: for the testinfra verifier'
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('7868a99e31e88d7264e2dc73bfe6c2ccf35ecc97e26d95f531135fb0638c74fd5a2eab809c79f80d5a670e3bf893334439b8274dacb472581a20dd8621adb24c')
b2sums=('fabc15b17cc950bc0cb776ebc39dfea04b5867b95f5991ff03ba1089195077531c72e3b7786976cec7fac23a7abb5c179b46faaf28abb2bdd467b546399f08a2')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cd $pkgname-$pkgver

  # install into test location
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  export PATH="test_dir/usr/bin:$PATH"
  pytest -v "test_dir/$site_packages/molecule/test/a_unit/" -c /dev/null
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
