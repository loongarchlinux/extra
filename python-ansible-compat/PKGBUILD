# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

_name=ansible-compat
pkgname=python-ansible-compat
pkgver=4.1.11
pkgrel=1
pkgdesc="Functions that help interacting with various versions of Ansible"
arch=(any)
url="https://github.com/ansible-community/ansible-compat"
license=(MIT)
depends=(
  ansible-core
  python
  python-jsonschema
  python-packaging
  python-pyyaml
  python-subprocess-tee
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-mock
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('92f89f82ed7ddae8215ecfcb55ec1b8822122f12289f0e712625d609f20e99b3')
b2sums=('d742104e6604433f07eade86289ea6dec32961e5d009705bbe34dee210adaa30f44ba4fadfeb880ae049f582cb15ebf38b39cc6d5beb812a4b23f2043eb6a7ac')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # disable broken tests: https://github.com/ansible/ansible-compat/issues/210
    --deselect test/test_runtime.py::test_prerun_reqs_v1
    --deselect test/test_runtime.py::test_prerun_reqs_v2
    # disable tests that want to download the internet
    --deselect test/test_runtime.py::test_install_collection_git
    --deselect test/test_runtime.py::test_install_collection_from_disk[normal]
    --deselect test/test_runtime.py::test_install_collection_from_disk[deep]
  )
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$_site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
