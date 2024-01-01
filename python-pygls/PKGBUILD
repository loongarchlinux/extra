# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Otreblan <otreblain@gmail.com>

pkgname=python-pygls
_name=${pkgname#python-}
pkgver=1.2.1
pkgrel=1
pkgdesc='Pythonic generic implementation of the Language Server Protocol'
arch=('any')
url=https://github.com/openlawlibrary/pygls
license=('APACHE')
depends=('python-lsprotocol')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest-asyncio')
source=("git+$url.git#tag=v$pkgver")
b2sums=('SKIP')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  PYTHONPATH="$PWD/$_name:$PYTHONPATH" pytest
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/LICENSE.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
