# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=jedi-language-server
pkgver=0.41.3
pkgrel=2
pkgdesc='Language server for Jedi'
arch=('any')
url=https://github.com/pappasam/jedi-language-server
license=('MIT')
depends=(
  'python-docstring-to-markdown'
  'python-jedi'
  'python-pygls'
)
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-lsp-jsonrpc' 'python-pyhamcrest' 'python-pytest')
source=("git+$url.git#tag=v$pkgver")
b2sums=('46890caee2822a7528c70382516ec943493c39f9d912d94325979ac54d086633691dea814ca39a9ac46e3ef6d5a6c4eb0923f921eab691cdb232984c4bd555ad')

prepare() {
  cd $pkgname
  # Remove include list https://github.com/pypa/wheel/issues/92
  sed -i '/include = \["README.md"\]/d' pyproject.toml
}

build() {
  cd $pkgname
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  python -m installer --destdir=temp dist/*.whl
  PATH="$PWD/temp/usr/bin:$PATH" test-env/bin/python -m pytest tests
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/${pkgname//-/_}-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
