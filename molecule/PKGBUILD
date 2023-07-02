# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=molecule
pkgver=5.1.0
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
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('4d025a512e3a6ac7f424318f06bb23b2c1ef1cc122d31d012430bfccf4efeeb3c7ddf2450abd78378c1c50f54fffb1fa8f366f14eebe58125f177ced8cec3ff5')
b2sums=('55c2f3c181bef6ab848cf7b52b19649fd861dbdbd68b92d3de9e0a1330755b9b887affd8f78e92ab33145ed60e7131d3cf1ffb7b4d8f10c1c3cab8dd58288af9')

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
  pytest -v "test_dir/$site_packages/molecule/test/unit/" -c /dev/null
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
