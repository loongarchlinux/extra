# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=molecule
pkgver=6.0.3
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
  python-regress
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
sha512sums=('a05a430169b7fb27ae527e63dd49cde4a4dc95ff31f454e75f76438a3b022821ca77ba32389e1c77d32ffc7ef06537aeaea24c48ab6e10b9a230cc2beab30c4c')
b2sums=('dfa7f3d8b93f778dda754feddf4f4ab25d0e47eb805b85252b74625dc86508c8c94cf0f4e9cb499bdc77b93fba1f1330f17a6d917f44466985ef20eee1543826')

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
  pytest -v test/a_unit/ -c /dev/null
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
