# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=tmuxp
pkgver=1.34.0
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
sha512sums=('d93d39a052d39864577eca36a6a723baf70d65cb058a2ea5572380eb7d60361cfe5893ed640e115094771819d20dd0b11ce2fab205c551b933825447dd3e89ca')
b2sums=('44ee3e57e5e83364ee204f32b711c6d14b2e39626b3a2e71af92e432e7036740e43dc9434c15a87d68a57ed9ed3af9068138eeabf916565c945bad82a591b5c7')

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
