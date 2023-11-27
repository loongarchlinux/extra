# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=tmuxp
pkgver=1.32.1
pkgrel=1
pkgdesc="Tmux session manager built on libtmux"
arch=(any)
url="https://tmuxp.git-pull.com/en/latest/"
_url="https://github.com/tmux-python/tmuxp"
license=(MIT)
depends=(
  python
  python-colorama
  python-libtmux
  python-pyyaml
  python-typing-extensions
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-shtab
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-mock
  python-pytest-rerunfailures
)
optdepends=(
  'python-shtab: for workspace completion and import'
  'ipython: for alternative CLI'
  'python-prompt_toolkit: for alternative CLI'
  'bpython: for alternative CLI'
  # TODO: package ptpython for additional alternative CLI
)
source=($pkgname-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('096831f3da4b3ead1ef8dda20248fde334f6c0fd14661823db163a234afbad275b8b54791cc358365454aedf8277b8956bd3c7d27a36f4978982617462992517')
b2sums=('c9c095e43030f22a85ea7dc91bbf21e91d9eaf5c9b653f5c7a0cc49e6246e1af13e4e83f7df893665f455d5d7de1326c62df05ee7fc3f573dd58a746fdce1dda')

build() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation

  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  mkdir -v completions
  shtab --shell=bash tmuxp.cli.create_parser > completions/$pkgname
  shtab --shell=zsh tmuxp.cli.create_parser > completions/_$pkgname
}

check() {
  local python_options=(
    -vv
    # https://github.com/tmux-python/tmuxp/issues/855
    --deselect tests/workspace/test_builder.py::test_window_shell
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname-$pkgver
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${python_options[@]}" tests
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {CHANGES,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 examples/*.{json,yaml} -t "$pkgdir/usr/share/doc/$pkgname/examples/"
  install -vDm 644 completions/$pkgname -t "$pkgdir/usr/share/bash-completion/completions/"
  install -vDm 644 completions/_$pkgname -t "$pkgdir/usr/share/zsh/site-functions/"
}

# vim:set ts=2 sw=2 et:
