# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=python-feedparser
_name=${pkgname#python-}
pkgver=6.0.11
pkgrel=2
pkgdesc='Parse RSS and Atom feeds in Python'
arch=('any')
url=https://github.com/kurtmckee/feedparser
license=('custom')
depends=('libxml2' 'python-sgmllib3k')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-chardet')
optdepends=(
  'python-chardet: for character encoding auto-detection'
  'python-cchardet: for faster character encoding auto-detection'
)
source=(
  "git+$url.git#tag=$pkgver"
  'feedparser-fix-tests-on-py310.patch::https://github.com/kurtmckee/feedparser/commit/c55bd8ad37db89bd219783bc514d600c9523ed38.patch'
)
b2sums=('c8bf816c44765318b3991ebad60b97e458cdc736d36280d73b3d5a576e5e8a77aca055d2a7f2a2f48b4eaebc3c2a4be9bc26dad7a51d8a88392d7f2fffafc93b'
        'b803c355e8ed8ee941e4478d3e05271eaf49686a45d32d1d62217811ea64e6315ff9d8e83456267e67ceb5f84c6a3000b61f5a7eccd3ead6fb8e2286864e651e')

prepare() {
  cd "$_name"
  patch --forward --strip=1 --input=../feedparser-fix-tests-on-py310.patch
}

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  # https://github.com/kurtmckee/feedparser/issues/236
  mv tests/illformed/undeclared_namespace.xml{,.bak}
  PYTHONPATH="$PWD/build/lib" python tests/runtests.py
  mv tests/illformed/undeclared_namespace.xml{.bak,}
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
