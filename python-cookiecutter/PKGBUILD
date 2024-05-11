# Maintainer: David Runge <dvzrv@archlinux.org>

_name=cookiecutter
pkgname=python-cookiecutter
pkgver=2.6.0
pkgrel=2
pkgdesc="A command-line utility that creates projects from project templates"
arch=(any)
url="https://github.com/cookiecutter/cookiecutter"
license=(BSD-3-Clause)
depends=(
  python
  python-arrow
  python-binaryornot
  python-click
  python-jinja
  python-pyyaml
  python-requests
  python-rich
  python-slugify
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-freezegun
  python-pytest
  python-pytest-mock
)
source=($url/archive/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('619be103bb831cbe9c50c4fa5114d6151a462a29a233f8999305403dda449f90a5900940a2b9d98433a8cdd3dbad421afe6feded42f4bcb6ee83523570ed2c1e')
b2sums=('967264bdf2b7f7ec7d2466d530e9ab6f689f88bb8537f833f76b952f4cbec07cfdf8c17c3f9690023f3687a8aab66ecb5dfe609e58ed933f1fcd2fc2174938f2')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -o addopts=''  # we do not care about coverage
    # ignore tests that download the internet with git
    --deselect tests/vcs/test_clone.py::test_clone_handles_repo_typo
    --deselect tests/vcs/test_clone.py::test_clone_handles_branch_typo
    --deselect tests/vcs/test_clone.py::test_clone_unknown_subprocess_error
  )

  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
