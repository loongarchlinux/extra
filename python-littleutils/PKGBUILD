# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=python-littleutils
_name=${pkgname#python-}
pkgver=0.2.2
pkgrel=6
pkgdesc='Small personal collection of python utility functions'
arch=('any')
url=https://github.com/alexmojaki/littleutils
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('b3df61e0e672f4f0e584aa505a073ae54fc1e0ecd45aed3d957c17d4e163ab315a171cfc6a61a0467fd132c5929c16756601702402fb4bc04f077f67d9ef7d70')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  python littleutils/__init__.py
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
