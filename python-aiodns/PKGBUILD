# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-aiodns
_name=${pkgname#python-}
pkgver=3.1.1
pkgrel=1
pkgdesc='Simple DNS resolver for asyncio'
arch=('any')
url=https://github.com/saghul/aiodns
license=('MIT')
depends=('python-pycares')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("git+$url.git#tag=v$pkgver")
b2sums=('SKIP')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  pytest -k 'not test_gethostbyaddr' tests.py
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
